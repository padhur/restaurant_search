package com.burakeregar.githubsearch.api

import com.burakeregar.githubsearch.home.model.RestaurantList
import io.reactivex.Observable
import retrofit2.http.GET
import retrofit2.http.Query

interface Endpoints {
    @GET("/restaurants?")
    fun searchRestaurants(@Query("q") key: String): Observable<RestaurantList>
}