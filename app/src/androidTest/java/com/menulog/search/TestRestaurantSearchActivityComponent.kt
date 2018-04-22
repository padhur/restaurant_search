package com.menulog.search

import com.base.di.component.AppComponent
import com.menulog.search.di.RestaurantSearchActivityComponent
import com.menulog.search.di.RestaurantSearchActivityModule
import dagger.Component

/**
 * Created by padmanabanramasamy on 22/4/18.
 */
@Component(dependencies = arrayOf(AppComponent::class),
        modules = arrayOf(RestaurantSearchActivityModule::class))
interface TestRestaurantSearchActivityComponent : RestaurantSearchActivityComponent {
    fun inject(test: TestRestaurantSearchActivity)
}