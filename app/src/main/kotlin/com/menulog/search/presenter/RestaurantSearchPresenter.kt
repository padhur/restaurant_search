package com.menulog.search.presenter

import com.base.mvp.BasePresenter
import com.base.util.SchedulerProvider
import io.reactivex.disposables.CompositeDisposable
import com.menulog.search.api.Endpoints
import javax.inject.Inject

class RestaurantSearchPresenter @Inject constructor(var api: Endpoints, disposable:
CompositeDisposable, scheduler: SchedulerProvider) : BasePresenter<RestaurantSearchView>
(disposable, scheduler) {

    fun getRestaurants(searchKey: String) {
        view?.showProgress()
        disposable.add(api.searchRestaurants(searchKey)
                .subscribeOn(scheduler.io())
                .observeOn(scheduler.ui())
                .subscribe(
                        { result ->
                            view?.hideProgress()
                            view?.onSearchResponse(result?.restaurants)
                            if (result.restaurants?.size == 0) {
                                view?.noResult()
                            }
                        },
                        { _ ->
                            view?.hideProgress()
                            view?.onError()
                        })
        )
    }
}