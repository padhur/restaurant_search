package com.burakeregar.githubsearch.home.presenter

import com.base.mvp.BaseView
import com.burakeregar.githubsearch.home.model.RestaurantsItem

interface RestaurantSearchView : BaseView {
    fun onSearchResponse(list: List<RestaurantsItem>?)
    fun showProgress()
    fun hideProgress()
    fun noResult()
}
