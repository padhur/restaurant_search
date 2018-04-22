package com.menulog.search.presenter

import com.base.mvp.BaseView
import com.menulog.search.model.RestaurantsItem

interface RestaurantSearchView : BaseView {
    fun onSearchResponse(list: List<RestaurantsItem>?)
    fun showProgress()
    fun hideProgress()
    fun noResult()
}
