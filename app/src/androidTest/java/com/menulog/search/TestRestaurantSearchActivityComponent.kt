package com.burakeregar.githubsearch

import com.base.di.component.AppComponent
import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityComponent
import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityModule
import dagger.Component

/**
 * Created by padmanabanramasamy on 22/4/18.
 */
@Component(dependencies = arrayOf(AppComponent::class),
        modules = arrayOf(RestaurantSearchActivityModule::class))
interface TestRestaurantSearchActivityComponent : RestaurantSearchActivityComponent {
    fun inject(test: TestRestaurantSearchActivity)
}