package com.menulog.search

import android.support.test.InstrumentationRegistry
import android.support.test.espresso.Espresso.onView
import android.support.test.espresso.matcher.ViewMatchers
import android.support.test.rule.ActivityTestRule
import android.support.test.runner.AndroidJUnit4
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.MockitoAnnotations
import android.widget.EditText
import android.support.test.espresso.action.ViewActions.*
import android.support.test.espresso.matcher.ViewMatchers.*
import android.support.v7.widget.RecyclerView
import junit.framework.Assert.*
import com.base.RestaurantSearchApp
import com.menulog.search.di.RestaurantSearchActivityComponent
import com.menulog.search.ui.RestaurantSearchActivity
import com.menulog.search.utils.TestUtils
import dagger.Component
import javax.inject.Singleton


/**
 * Created by padmanabanramasamy on 22/4/18.
 */
@RunWith(AndroidJUnit4::class)
class TestRestaurantSearchActivity: TestUtils()  {
    private val searchKey: String = "se19"

    @get:Rule
    val testRule: ActivityTestRule<RestaurantSearchActivity>
            = ActivityTestRule(RestaurantSearchActivity::class.java, false, false)


    @Before
    fun setup() {
        MockitoAnnotations.initMocks(this)
    }

    @Test
    @Throws(InterruptedException::class)
    fun testRestaurantSearch() {
        testRule.launchActivity(null)
        onView(ViewMatchers.withId(R.id.restaurant_SearchView)).perform(click())
        onView(isAssignableFrom(EditText::class.java)).perform(clearText(), typeText(searchKey), pressImeActionButton())
        val recyclerView = testRule.activity.findViewById(R.id.restaurant_recylerview) as RecyclerView
        waitForCondition(object : TestUtils.Condition {
            override val isSatisfied: Boolean
                get() = recyclerView.adapter.itemCount != 0
        }, 4000)
        assertNotNull(recyclerView)
        assertNotNull(recyclerView.adapter)
        assertNotSame(0, recyclerView.adapter.itemCount)
    }

    @Test
    @Throws(InterruptedException::class)
    fun testRestaurantSearchWithEmptyString() {
        testRule.launchActivity(null)
        onView(ViewMatchers.withId(R.id.restaurant_SearchView)).perform(click())
        onView(isAssignableFrom(EditText::class.java)).perform(clearText(), pressImeActionButton())
        val recyclerView = testRule.activity.findViewById(R.id.restaurant_recylerview) as RecyclerView
        waitForCondition(object : TestUtils.Condition {
            override val isSatisfied: Boolean
                get() = recyclerView.adapter.itemCount != 0
        }, 4000)
        assertNotNull(recyclerView)
        assertNotNull(recyclerView.adapter)
        assertSame(0, recyclerView.adapter.itemCount)
    }
}




