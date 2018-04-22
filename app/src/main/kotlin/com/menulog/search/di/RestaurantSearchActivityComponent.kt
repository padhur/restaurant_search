package com.menulog.search.di

import com.base.di.ActivityScope
import com.base.di.component.AppComponent
import com.menulog.search.ui.RestaurantSearchActivity

import dagger.Component

@ActivityScope
@Component(dependencies = arrayOf(AppComponent::class),
        modules = arrayOf(RestaurantSearchActivityModule::class))
interface RestaurantSearchActivityComponent {

    fun inject(restaurantSearchActivity: RestaurantSearchActivity)
}
