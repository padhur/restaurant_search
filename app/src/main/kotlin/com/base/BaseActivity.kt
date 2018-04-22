package com.base

import android.os.Bundle
import android.support.annotation.VisibleForTesting
import android.support.v7.app.AppCompatActivity
import com.base.di.component.AppComponent
import com.base.mvp.BaseView
import com.base.mvp.BasePresenter
import com.burakeregar.githubsearch.R
import org.greenrobot.eventbus.EventBus
import org.jetbrains.anko.toast

abstract class BaseActivity: AppCompatActivity(), BaseView {

    private var presenter: BasePresenter<*>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        onActivityInject()
    }

    protected abstract fun onActivityInject()

    fun getAppcomponent(): AppComponent = RestaurantSearchApp.appComponent

    override fun setPresenter(presenter: BasePresenter<*>) {
        this.presenter = presenter
    }

    override fun onError() {
        toast(getString(R.string.error_msg))
    }

    override fun onStart() {
        super.onStart()
        EventBus.getDefault().register(this)
    }

    override fun onStop() {
        super.onStop()
        EventBus.getDefault().unregister(this)
    }

    override fun onDestroy() {
        super.onDestroy()
        presenter?.detachView()
        presenter = null
    }
}
