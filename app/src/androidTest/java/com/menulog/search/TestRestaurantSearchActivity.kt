package com.burakeregar.githubsearch

import android.support.test.InstrumentationRegistry
import android.support.test.espresso.Espresso.onView
import android.support.test.espresso.matcher.ViewMatchers
import android.support.test.rule.ActivityTestRule
import android.support.test.runner.AndroidJUnit4
import com.burakeregar.githubsearch.home.RestaurantSearchActivity
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.MockitoAnnotations
import android.widget.EditText
import android.support.test.espresso.action.ViewActions.*
import android.support.test.espresso.matcher.ViewMatchers.*
import android.support.v7.widget.RecyclerView
import com.burakeregar.githubsearch.utils.TestUtils
import junit.framework.Assert.*
import com.base.RestaurantSearchApp
import com.base.di.component.AppComponent
import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityComponent
import dagger.Component
import javax.inject.Singleton


/**
 * Created by padmanabanramasamy on 22/4/18.
 */
@RunWith(AndroidJUnit4::class)
class TestRestaurantSearchActivity: RestaurantSearchActivityComponent, TestUtils()  {
    override fun inject(restaurantSearchActivity: RestaurantSearchActivity) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }

    @Singleton
    @Component(modules = arrayOf(RestaurantSearchActivityComponent::class))
    interface TestComponent : RestaurantSearchActivityComponent {
        fun inject(restaurantSearchActivity: TestRestaurantSearchActivity)
    }

    private val searchKey: String = "se19"

    @get:Rule
    val testRule: ActivityTestRule<RestaurantSearchActivity>
            = ActivityTestRule(RestaurantSearchActivity::class.java, false, false)


    @Before
    fun setup() {
        MockitoAnnotations.initMocks(this)
        val instrumentation = InstrumentationRegistry.getInstrumentation()
        val app = instrumentation.targetContext.applicationContext as RestaurantSearchApp
        val component = app.component() as TestComponent
        component.inject(this)
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




