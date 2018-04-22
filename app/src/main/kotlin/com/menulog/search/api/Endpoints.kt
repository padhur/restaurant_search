package com.menulog.search.api

import com.menulog.search.model.RestaurantList
import io.reactivex.Observable
import retrofit2.http.GET
import retrofit2.http.Query

interface Endpoints {
    @GET("/restaurants?")
    fun searchRestaurants(@Query("q") key: String): Observable<RestaurantList>
}