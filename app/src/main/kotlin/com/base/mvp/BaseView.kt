package com.base.mvp

interface BaseView {
    fun onError()
    fun setPresenter(presenter: BasePresenter<*>)
}