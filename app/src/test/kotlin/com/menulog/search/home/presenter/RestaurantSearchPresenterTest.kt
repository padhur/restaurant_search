package com.burakeregar.githubsearch.home.presenter

import com.burakeregar.githubsearch.api.Endpoints
import com.burakeregar.githubsearch.home.model.RestaurantList
import com.burakeregar.githubsearch.home.model.RestaurantsItem
import com.nhaarman.mockito_kotlin.doReturn
import com.nhaarman.mockito_kotlin.mock
import com.nhaarman.mockito_kotlin.verify
import com.util.TestSchedulerProvider
import io.reactivex.Observable
import org.junit.Before
import org.junit.Test
import io.reactivex.schedulers.TestScheduler
import io.reactivex.disposables.CompositeDisposable
import org.junit.After
import org.mockito.Mockito
import org.mockito.Mockito.`when`
import org.mockito.Mockito.times


class RestaurantSearchPresenterTest {

    private val view: RestaurantSearchView = mock()
    private val api: Endpoints = mock()
    private lateinit var presenter: RestaurantSearchPresenter
    private lateinit var testScheduler: TestScheduler
    private val searchKey: String = "se19"

    @Before
    fun setup() {
        val compositeDisposable = CompositeDisposable()
        testScheduler = TestScheduler()
        val testSchedulerProvider = TestSchedulerProvider(testScheduler)
        presenter = RestaurantSearchPresenter(api, compositeDisposable, testSchedulerProvider)
        presenter.attachView(view)
    }

    @Test
    fun test_getRestaurants_should_callSuccess() {
        val mockedResponse: RestaurantList = mock()

        doReturn(Observable.just(mockedResponse))
                .`when`(api)
                .searchRestaurants(searchKey)

        presenter.getRestaurants(searchKey)

        testScheduler.triggerActions()

        verify(view).showProgress()
        verify(view).onSearchResponse(mockedResponse.restaurants)
        verify(view).hideProgress()

    }

    @Test
    fun test_getRestaurants_shouldNot_callNoResult() {
        val mockedResponse: RestaurantList = mock()
        val items = ArrayList<RestaurantsItem>()

        items.add(Mockito.mock(RestaurantsItem::class.java))

        `when`(mockedResponse.restaurants).thenReturn(items)

        doReturn(Observable.just(mockedResponse))
                .`when`(api)
                .searchRestaurants(searchKey)

        presenter.getRestaurants(searchKey)

        testScheduler.triggerActions()

        verify(view, times(0)).noResult()
    }

    @Test
    fun test_getRestaurants_should_callNoResult() {
        val mockedResponse: RestaurantList = mock()
        val items = ArrayList<RestaurantsItem>()

        `when`(mockedResponse.restaurants).thenReturn(items)

        doReturn(Observable.just(mockedResponse))
                .`when`(api)
                .searchRestaurants(searchKey)

        presenter.getRestaurants(searchKey)

        testScheduler.triggerActions()

        verify(view).noResult()
    }

    @Test
    fun test_getRestaurants_should_callError() {
        val mockedResponse: Throwable = mock()

        doReturn(Observable.just(mockedResponse))
                .`when`(api)
                .searchRestaurants(searchKey)

        presenter.getRestaurants(searchKey)

        testScheduler.triggerActions()

        verify(view).showProgress()
        verify(view).onError()
        verify(view).hideProgress()
    }

    @After
    fun tearDown() {
        presenter.detachView()
    }

}