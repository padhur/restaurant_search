package com.burakeregar.githubsearch.home.di

import com.base.di.ActivityScope
import com.base.util.AppSchedulerProvider
import com.burakeregar.githubsearch.api.Endpoints
import com.burakeregar.githubsearch.home.presenter.RestaurantSearchPresenter
import dagger.Module
import dagger.Provides
import io.reactivex.disposables.CompositeDisposable

@Module
class RestaurantSearchActivityModule {

    @Provides
    @ActivityScope
    internal fun providesRestaurantSearchPresenter(api: Endpoints, disposable: CompositeDisposable,
                                                   scheduler: AppSchedulerProvider):
            RestaurantSearchPresenter = RestaurantSearchPresenter(api, disposable, scheduler)
}
