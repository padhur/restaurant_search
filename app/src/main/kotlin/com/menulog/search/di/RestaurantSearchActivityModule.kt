package com.menulog.search.di

import com.base.di.ActivityScope
import com.base.util.AppSchedulerProvider
import com.menulog.search.api.Endpoints
import com.menulog.search.presenter.RestaurantSearchPresenter
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
