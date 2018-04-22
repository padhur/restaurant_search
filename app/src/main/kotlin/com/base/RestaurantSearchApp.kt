package com.base

import android.app.Application
import com.base.di.component.AppComponent
import com.base.di.component.DaggerAppComponent
import com.base.di.module.AppModule
import com.burakeregar.githubsearch.BuildConfig
import com.facebook.stetho.Stetho

class RestaurantSearchApp : Application() {

    companion object{
       @JvmStatic lateinit var appComponent: AppComponent
    }

    override fun onCreate() {
        super.onCreate()
        if(BuildConfig.DEBUG)
            Stetho.initializeWithDefaults(this);
        initDagger()
    }

    private fun initDagger() {
        appComponent = DaggerAppComponent.builder().appModule(AppModule(this)).build()
    }

    fun component(): AppComponent {
        return appComponent
    }

}