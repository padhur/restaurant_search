package com.menulog.search.ui

import android.view.View
import com.bumptech.glide.Glide
import com.burakeregar.easiestgenericrecycleradapter.base.GenericViewHolder
import com.menulog.search.model.RestaurantsItem
import kotlinx.android.synthetic.main.restaurant_item.view.*
import org.greenrobot.eventbus.EventBus

class RestaurantSearchViewHolder(itemView: View?) : GenericViewHolder<Any>(itemView) {
    private lateinit var item: RestaurantsItem

    override fun bindData(p0: Any?) {
        item = p0 as RestaurantsItem
        with(itemView) {
            tv_restaurant_name?.setBackgroundResource(android.R.color.transparent)
            tv_restaurant_name?.text = item.name
            var cuisine_firstname: String = ""
            if(item.cuisineTypes != null && item.cuisineTypes!!.size > 1) {
                cuisine_firstname = item.cuisineTypes?.get(1)?.name +", "
            }
            tv_restaurant_cuisine?.setBackgroundResource(android.R.color.transparent)
            tv_restaurant_cuisine?.text =  cuisine_firstname + item.cuisineTypes?.get(0)?.name
            tv_restaurant_totalratings?.setBackgroundResource(android.R.color.transparent)
            tv_restaurant_totalratings?.text = "("+item.numberOfRatings+")"
            restaurant_rating?.setBackgroundResource(android.R.color.transparent)
            restaurant_rating?.rating = item.ratingStars
            img_restaurant_logo?.setBackgroundResource(android.R.color.transparent)
            Glide.with(context)
                    .load(item.logo?.get(0)?.standardResolutionURL)
                    .into(img_restaurant_logo)
            restaurant_parent_layout?.setOnClickListener {
                EventBus.getDefault().post(item)
            }
        }
    }
}