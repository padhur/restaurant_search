package com.burakeregar.githubsearch.home.di

import com.base.di.ActivityScope
import com.base.di.component.AppComponent
import com.burakeregar.githubsearch.home.RestaurantSearchActivity

import dagger.Component

@ActivityScope
@Component(dependencies = arrayOf(AppComponent::class),
        modules = arrayOf(RestaurantSearchActivityModule::class))
interface RestaurantSearchActivityComponent {

    fun inject(restaurantSearchActivity: RestaurantSearchActivity)
}
