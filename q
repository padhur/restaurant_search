[1mdiff --git a/app/src/androidTest/java/com/menulog/search/TestAppModule.kt b/app/src/androidTest/java/com/menulog/search/TestAppModule.kt[m
[1mindex d337ad3..d7c1712 100644[m
[1m--- a/app/src/androidTest/java/com/menulog/search/TestAppModule.kt[m
[1m+++ b/app/src/androidTest/java/com/menulog/search/TestAppModule.kt[m
[36m@@ -1,4 +1,4 @@[m
[31m-package com.burakeregar.githubsearch[m
[32m+[m[32mpackage com.menulog.search[m
 [m
 /**[m
  * Created by padmanabanramasamy on 22/4/18.[m
[1mdiff --git a/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivity.kt b/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivity.kt[m
[1mindex dacd459..37af08f 100644[m
[1m--- a/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivity.kt[m
[1m+++ b/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivity.kt[m
[36m@@ -1,11 +1,10 @@[m
[31m-package com.burakeregar.githubsearch[m
[32m+[m[32mpackage com.menulog.search[m
 [m
 import android.support.test.InstrumentationRegistry[m
 import android.support.test.espresso.Espresso.onView[m
 import android.support.test.espresso.matcher.ViewMatchers[m
 import android.support.test.rule.ActivityTestRule[m
 import android.support.test.runner.AndroidJUnit4[m
[31m-import com.burakeregar.githubsearch.home.RestaurantSearchActivity[m
 import org.junit.Before[m
 import org.junit.Rule[m
 import org.junit.Test[m
[36m@@ -15,11 +14,11 @@[m [mimport android.widget.EditText[m
 import android.support.test.espresso.action.ViewActions.*[m
 import android.support.test.espresso.matcher.ViewMatchers.*[m
 import android.support.v7.widget.RecyclerView[m
[31m-import com.burakeregar.githubsearch.utils.TestUtils[m
 import junit.framework.Assert.*[m
 import com.base.RestaurantSearchApp[m
[31m-import com.base.di.component.AppComponent[m
[31m-import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityComponent[m
[32m+[m[32mimport com.menulog.search.di.RestaurantSearchActivityComponent[m
[32m+[m[32mimport com.menulog.search.ui.RestaurantSearchActivity[m
[32m+[m[32mimport com.menulog.search.utils.TestUtils[m
 import dagger.Component[m
 import javax.inject.Singleton[m
 [m
[36m@@ -28,17 +27,7 @@[m [mimport javax.inject.Singleton[m
  * Created by padmanabanramasamy on 22/4/18.[m
  */[m
 @RunWith(AndroidJUnit4::class)[m
[31m-class TestRestaurantSearchActivity: RestaurantSearchActivityComponent, TestUtils()  {[m
[31m-    override fun inject(restaurantSearchActivity: RestaurantSearchActivity) {[m
[31m-        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.[m
[31m-    }[m
[31m-[m
[31m-    @Singleton[m
[31m-    @Component(modules = arrayOf(RestaurantSearchActivityComponent::class))[m
[31m-    interface TestComponent : RestaurantSearchActivityComponent {[m
[31m-        fun inject(restaurantSearchActivity: TestRestaurantSearchActivity)[m
[31m-    }[m
[31m-[m
[32m+[m[32mclass TestRestaurantSearchActivity: TestUtils()  {[m
     private val searchKey: String = "se19"[m
 [m
     @get:Rule[m
[36m@@ -49,10 +38,6 @@[m [mclass TestRestaurantSearchActivity: RestaurantSearchActivityComponent, TestUtils[m
     @Before[m
     fun setup() {[m
         MockitoAnnotations.initMocks(this)[m
[31m-        val instrumentation = InstrumentationRegistry.getInstrumentation()[m
[31m-        val app = instrumentation.targetContext.applicationContext as RestaurantSearchApp[m
[31m-        val component = app.component() as TestComponent[m
[31m-        component.inject(this)[m
     }[m
 [m
     @Test[m
[1mdiff --git a/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivityComponent.kt b/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivityComponent.kt[m
[1mindex 6cd4d08..ff3a86b 100644[m
[1m--- a/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivityComponent.kt[m
[1m+++ b/app/src/androidTest/java/com/menulog/search/TestRestaurantSearchActivityComponent.kt[m
[36m@@ -1,8 +1,8 @@[m
[31m-package com.burakeregar.githubsearch[m
[32m+[m[32mpackage com.menulog.search[m
 [m
 import com.base.di.component.AppComponent[m
[31m-import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityComponent[m
[31m-import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityModule[m
[32m+[m[32mimport com.menulog.search.di.RestaurantSearchActivityComponent[m
[32m+[m[32mimport com.menulog.search.di.RestaurantSearchActivityModule[m
 import dagger.Component[m
 [m
 /**[m
[1mdiff --git a/app/src/androidTest/java/com/menulog/search/TestSchedulerProvider.kt b/app/src/androidTest/java/com/menulog/search/TestSchedulerProvider.kt[m
[1mindex 8d00167..56e64d7 100644[m
[1m--- a/app/src/androidTest/java/com/menulog/search/TestSchedulerProvider.kt[m
[1m+++ b/app/src/androidTest/java/com/menulog/search/TestSchedulerProvider.kt[m
[36m@@ -1,4 +1,4 @@[m
[31m-package com.burakeregar.githubsearch[m
[32m+[m[32mpackage com.menulog.search[m
 [m
 import com.base.util.SchedulerProvider[m
 import io.reactivex.Scheduler[m
[1mdiff --git a/app/src/androidTest/java/com/menulog/search/utils/TestUtils.kt b/app/src/androidTest/java/com/menulog/search/utils/TestUtils.kt[m
[1mindex 459ad83..35b59f8 100644[m
[1m--- a/app/src/androidTest/java/com/menulog/search/utils/TestUtils.kt[m
[1m+++ b/app/src/androidTest/java/com/menulog/search/utils/TestUtils.kt[m
[36m@@ -1,4 +1,4 @@[m
[31m-package com.burakeregar.githubsearch.utils[m
[32m+[m[32mpackage com.menulog.search.utils[m
 [m
 import junit.framework.Assert.fail[m
 [m
[1mdiff --git a/app/src/main/AndroidManifest.xml b/app/src/main/AndroidManifest.xml[m
[1mindex ed291af..a5785ad 100755[m
[1m--- a/app/src/main/AndroidManifest.xml[m
[1m+++ b/app/src/main/AndroidManifest.xml[m
[36m@@ -1,6 +1,6 @@[m
 <?xml version="1.0" encoding="utf-8"?>[m
 <manifest xmlns:android="http://schemas.android.com/apk/res/android"[m
[31m-    package="com.burakeregar.githubsearch">[m
[32m+[m[32m    package="com.menulog.search">[m
 [m
     <uses-permission android:name="android.permission.INTERNET" />[m
     <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>[m
[36m@@ -13,7 +13,7 @@[m
         android:roundIcon="@mipmap/ic_launcher_round"[m
         android:supportsRtl="true"[m
         android:theme="@style/AppTheme">[m
[31m-        <activity android:name="com.burakeregar.githubsearch.home.RestaurantSearchActivity"[m
[32m+[m[32m        <activity android:name="com.menulog.search.ui.RestaurantSearchActivity"[m
             android:configChanges="keyboardHidden|orientation|screenSize">[m
             <intent-filter>[m
                 <action android:name="android.intent.action.MAIN" />[m
[1mdiff --git a/app/src/main/kotlin/com/base/BaseActivity.kt b/app/src/main/kotlin/com/base/BaseActivity.kt[m
[1mindex afd5043..3777b02 100755[m
[1m--- a/app/src/main/kotlin/com/base/BaseActivity.kt[m
[1m+++ b/app/src/main/kotlin/com/base/BaseActivity.kt[m
[36m@@ -1,12 +1,11 @@[m
 package com.base[m
 [m
 import android.os.Bundle[m
[31m-import android.support.annotation.VisibleForTesting[m
 import android.support.v7.app.AppCompatActivity[m
 import com.base.di.component.AppComponent[m
 import com.base.mvp.BaseView[m
 import com.base.mvp.BasePresenter[m
[31m-import com.burakeregar.githubsearch.R[m
[32m+[m[32mimport com.menulog.search.R[m
 import org.greenrobot.eventbus.EventBus[m
 import org.jetbrains.anko.toast[m
 [m
[1mdiff --git a/app/src/main/kotlin/com/base/RestaurantSearchApp.kt b/app/src/main/kotlin/com/base/RestaurantSearchApp.kt[m
[1mindex bb68ecb..89e1130 100755[m
[1m--- a/app/src/main/kotlin/com/base/RestaurantSearchApp.kt[m
[1m+++ b/app/src/main/kotlin/com/base/RestaurantSearchApp.kt[m
[36m@@ -4,8 +4,8 @@[m [mimport android.app.Application[m
 import com.base.di.component.AppComponent[m
 import com.base.di.component.DaggerAppComponent[m
 import com.base.di.module.AppModule[m
[31m-import com.burakeregar.githubsearch.BuildConfig[m
 import com.facebook.stetho.Stetho[m
[32m+[m[32mimport com.menulog.search.BuildConfig[m
 [m
 class RestaurantSearchApp : Application() {[m
 [m
[1mdiff --git a/app/src/main/kotlin/com/base/di/component/AppComponent.kt b/app/src/main/kotlin/com/base/di/component/AppComponent.kt[m
[1mindex 9c3c4e3..696cbc9 100755[m
[1m--- a/app/src/main/kotlin/com/base/di/component/AppComponent.kt[m
[1m+++ b/app/src/main/kotlin/com/base/di/component/AppComponent.kt[m
[36m@@ -8,9 +8,8 @@[m [mimport com.base.di.module.AppModule[m
 import com.base.di.module.OkHttpModule[m
 import com.base.di.module.RetrofitModule[m
 import com.base.util.AppSchedulerProvider[m
[31m-import com.burakeregar.githubsearch.api.Endpoints[m
[31m-import com.burakeregar.githubsearch.home.RestaurantSearchActivity[m
 import com.google.gson.Gson[m
[32m+[m[32mimport com.menulog.search.api.Endpoints[m
 import dagger.Component[m
 import io.reactivex.disposables.CompositeDisposable[m
 import okhttp3.Cache[m
[1mdiff --git a/app/src/main/kotlin/com/base/di/module/ApiModule.kt b/app/src/main/kotlin/com/base/di/module/ApiModule.kt[m
[1mindex ac6f3fa..71f93bf 100755[m
[1m--- a/app/src/main/kotlin/com/base/di/module/ApiModule.kt[m
[1m+++ b/app/src/main/kotlin/com/base/di/module/ApiModule.kt[m
[36m@@ -1,6 +1,6 @@[m
 package com.base.di.module[m
 [m
[31m-import com.burakeregar.githubsearch.api.Endpoints[m
[32m+[m[32mimport com.menulog.search.api.Endpoints[m
 import dagger.Module[m
 import dagger.Provides[m
 import retrofit2.Retrofit[m
[1mdiff --git a/app/src/main/kotlin/com/base/di/module/OkHttpModule.kt b/app/src/main/kotlin/com/base/di/module/OkHttpModule.kt[m
[1mindex 01bbad7..1bf0226 100755[m
[1m--- a/app/src/main/kotlin/com/base/di/module/OkHttpModule.kt[m
[1m+++ b/app/src/main/kotlin/com/base/di/module/OkHttpModule.kt[m
[36m@@ -1,9 +1,9 @@[m
 package com.base.di.module[m
 [m
 import android.app.Application[m
[31m-import com.burakeregar.githubsearch.BuildConfig[m
 import dagger.Module[m
 import com.facebook.stetho.okhttp3.StethoInterceptor[m
[32m+[m[32mimport com.menulog.search.BuildConfig[m
 import dagger.Provides[m
 import okhttp3.*[m
 import okhttp3.logging.HttpLoggingInterceptor[m
[1mdiff --git a/app/src/main/kotlin/com/base/di/module/RetrofitModule.kt b/app/src/main/kotlin/com/base/di/module/RetrofitModule.kt[m
[1mindex 0e4c857..6d3b3b8 100755[m
[1m--- a/app/src/main/kotlin/com/base/di/module/RetrofitModule.kt[m
[1m+++ b/app/src/main/kotlin/com/base/di/module/RetrofitModule.kt[m
[36m@@ -1,6 +1,6 @@[m
 package com.base.di.module[m
 [m
[31m-import com.burakeregar.githubsearch.BuildConfig[m
[32m+[m[32mimport com.menulog.search.BuildConfig[m
 import dagger.Module[m
 import dagger.Provides[m
 import okhttp3.OkHttpClient[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/api/Endpoints.kt b/app/src/main/kotlin/com/menulog/search/api/Endpoints.kt[m
[1mindex 1fafd8b..7cdec20 100755[m
[1m--- a/app/src/main/kotlin/com/menulog/search/api/Endpoints.kt[m
[1m+++ b/app/src/main/kotlin/com/menulog/search/api/Endpoints.kt[m
[36m@@ -1,6 +1,6 @@[m
[31m-package com.burakeregar.githubsearch.api[m
[32m+[m[32mpackage com.menulog.search.api[m
 [m
[31m-import com.burakeregar.githubsearch.home.model.RestaurantList[m
[32m+[m[32mimport com.menulog.search.model.RestaurantList[m
 import io.reactivex.Observable[m
 import retrofit2.http.GET[m
 import retrofit2.http.Query[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/home/RestaurantSearchActivity.kt b/app/src/main/kotlin/com/menulog/search/home/RestaurantSearchActivity.kt[m
[1mdeleted file mode 100755[m
[1mindex 659e9d1..0000000[m
[1m--- a/app/src/main/kotlin/com/menulog/search/home/RestaurantSearchActivity.kt[m
[1m+++ /dev/null[m
[36m@@ -1,272 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home[m
[31m-[m
[31m-import android.Manifest[m
[31m-import android.annotation.SuppressLint[m
[31m-import android.content.Intent[m
[31m-import android.content.pm.PackageManager[m
[31m-import android.location.Address[m
[31m-import android.location.Geocoder[m
[31m-import android.net.Uri[m
[31m-import android.os.Bundle[m
[31m-import android.provider.Settings[m
[31m-import android.support.design.widget.Snackbar[m
[31m-import android.support.v4.app.ActivityCompat[m
[31m-import android.support.v7.widget.LinearLayoutManager[m
[31m-import android.view.View[m
[31m-import com.base.BaseActivity[m
[31m-import com.burakeregar.githubsearch.R[m
[31m-//import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityModule[m
[31m-import com.burakeregar.githubsearch.home.presenter.RestaurantSearchPresenter[m
[31m-import com.burakeregar.githubsearch.home.presenter.RestaurantSearchView[m
[31m-import com.burakeregar.githubsearch.home.viewholder.RestaurantSearchViewHolder[m
[31m-import com.burakeregar.easiestgenericrecycleradapter.base.GenericAdapterBuilder[m
[31m-import com.burakeregar.easiestgenericrecycleradapter.base.GenericRecyclerAdapter[m
[31m-import com.burakeregar.githubsearch.home.model.*[m
[31m-import com.mancj.materialsearchbar.MaterialSearchBar[m
[31m-import kotlinx.android.synthetic.main.restaurant_activity.*[m
[31m-import org.greenrobot.eventbus.Subscribe[m
[31m-import org.jetbrains.anko.toast[m
[31m-import javax.inject.Inject[m
[31m-import android.view.inputmethod.InputMethodManager[m
[31m-import com.base.RestaurantSearchApp[m
[31m-import com.burakeregar.githubsearch.BuildConfig[m
[31m-import com.burakeregar.githubsearch.home.di.DaggerRestaurantSearchActivityComponent[m
[31m-import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityModule[m
[31m-//import com.burakeregar.githubsearch.home.di.DaggerRestaurantSearchActivityComponent[m
[31m-import com.google.android.gms.location.FusedLocationProviderClient[m
[31m-import com.google.android.gms.location.LocationServices[m
[31m-import java.io.IOException[m
[31m-import java.util.*[m
[31m-[m
[31m-[m
[31m-class RestaurantSearchActivity : BaseActivity(), RestaurantSearchView,[m
[31m-        MaterialSearchBar.OnSearchActionListener {[m
[31m-[m
[31m-    @Inject[m
[31m-    lateinit var presenter: RestaurantSearchPresenter[m
[31m-    private val REQUEST_PERMISSIONS_REQUEST_CODE = 34[m
[31m-[m
[31m-    /**[m
[31m-     * Provides the entry point to the Fused Location Provider API.[m
[31m-     */[m
[31m-    private lateinit var fusedLocationClient: FusedLocationProviderClient[m
[31m-    private var postCode: String = ""[m
[31m-[m
[31m-    private lateinit var recyclerAdapter: GenericRecyclerAdapter[m
[31m-[m
[31m-    override fun onCreate(savedInstanceState: Bundle?) {[m
[31m-        super.onCreate(savedInstanceState)[m
[31m-        setContentView(R.layout.restaurant_activity)[m
[31m-        postCode = getString(R.string.default_postcode)[m
[31m-        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)[m
[31m-        initAdapter()[m
[31m-        initSearchView()[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Method to init the RecyclerView and Adapter class.[m
[31m-     *[m
[31m-     */[m
[31m-    private fun initAdapter() {[m
[31m-        recyclerAdapter = GenericAdapterBuilder().addModel([m
[31m-                R.layout.restaurant_item,[m
[31m-                RestaurantSearchViewHolder::class.java,[m
[31m-                RestaurantsItem::class.java)[m
[31m-                .execute()[m
[31m-[m
[31m-        with(restaurant_recylerview) {[m
[31m-            layoutManager = LinearLayoutManager(this@RestaurantSearchActivity)[m
[31m-            adapter = recyclerAdapter[m
[31m-        }[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Method to init the configure the SearchBar Tab.[m
[31m-     *[m
[31m-     */[m
[31m-    private fun initSearchView() {[m
[31m-        with(restaurant_SearchView) {[m
[31m-            setHint(getString(R.string.restaurantsearch_hint))[m
[31m-            setSpeechMode(false)[m
[31m-            setOnSearchActionListener(this@RestaurantSearchActivity)[m
[31m-            restaurant_SearchView?.text = postCode[m
[31m-            restaurant_SearchView.enableSearch()[m
[31m-        }[m
[31m-    }[m
[31m-[m
[31m-    override fun onActivityInject() {[m
[31m-        DaggerRestaurantSearchActivityComponent.builder().appComponent(getAppcomponent())[m
[31m-                .restaurantSearchActivityModule(RestaurantSearchActivityModule())[m
[31m-                .build()[m
[31m-                .inject(this)[m
[31m-        /*(application as RestaurantSearchApp).component().inject(this)*/[m
[31m-[m
[31m-        presenter.attachView(this)[m
[31m-    }[m
[31m-[m
[31m-    override fun onSearchResponse(list: List<RestaurantsItem>?) {[m
[31m-        if(list?.size != 0)[m
[31m-            recyclerAdapter.setList(list)[m
[31m-    }[m
[31m-[m
[31m-    override fun showProgress() {[m
[31m-        restaurant_notificationcard.visibility = View.GONE[m
[31m-        restaurant_recylerview.visibility = View.GONE[m
[31m-        restaurant_Shimmer.visibility = View.VISIBLE[m
[31m-        restaurant_Shimmer.startShimmerAnimation()[m
[31m-    }[m
[31m-[m
[31m-    override fun hideProgress() {[m
[31m-        restaurant_recylerview.visibility = View.VISIBLE[m
[31m-        restaurant_Shimmer.visibility = View.GONE[m
[31m-        restaurant_Shimmer.stopShimmerAnimation()[m
[31m-    }[m
[31m-[m
[31m-    override fun onButtonClicked(buttonCode: Int) {}[m
[31m-[m
[31m-    override fun onSearchStateChanged(enabled: Boolean) {}[m
[31m-[m
[31m-    override fun onSearchConfirmed(text: CharSequence?) {[m
[31m-        presenter.getRestaurants(text?.toString() ?: "")[m
[31m-        val view = this.currentFocus[m
[31m-        if (view != null) {[m
[31m-            val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager[m
[31m-            imm.hideSoftInputFromWindow(view.windowToken, 0)[m
[31m-        }[m
[31m-    }[m
[31m-[m
[31m-    override fun noResult() {[m
[31m-        restaurant_recylerview.visibility = View.GONE[m
[31m-        restaurant_notificationcard.visibility = View.VISIBLE[m
[31m-        restaurant_result_message.text = getString(R.string.no_restaurants_found)[m
[31m-        toast(getString(R.string.no_restaurants_found))[m
[31m-    }[m
[31m-[m
[31m-    override fun onDestroy() {[m
[31m-        super.onDestroy()[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Shows a toast of the Item clicked in the Recyclerview.[m
[31m-     *[m
[31m-     * @param item The list view Item which got selected.[m
[31m-     */[m
[31m-    @Subscribe[m
[31m-    fun onRowClicked(item: RestaurantsItem) {[m
[31m-        toast("${getString(R.string.restaurant_name)} ${item.name}")[m
[31m-    }[m
[31m-[m
[31m-    override fun onStart() {[m
[31m-        super.onStart()[m
[31m-[m
[31m-        if (!checkPermissions()) {[m
[31m-            requestPermissions()[m
[31m-        } else {[m
[31m-            getLastDeviceLocation()[m
[31m-        }[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Provides a simple way of getting a device's location and is well suited for[m
[31m-     * applications that do not require a fine-grained location and that do not need location[m
[31m-     * updates.[m
[31m-     */[m
[31m-    @SuppressLint("MissingPermission")[m
[31m-    private fun getLastDeviceLocation() {[m
[31m-        fusedLocationClient.lastLocation[m
[31m-                .addOnCompleteListener(this) { task ->[m
[31m-                    if (task.isSuccessful && task.result != null) {[m
[31m-                        getlocationcode(task.result.latitude,task.result.longitude)[m
[31m-                    } else {[m
[31m-                        showSnackbar(R.string.no_location_detected)[m
[31m-                    }[m
[31m-                }[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Shows a [Snackbar].[m
[31m-     *[m
[31m-     * @param snackStrId The id for the string resource for the Snackbar text.[m
[31m-     * @param actionStrId The text of the action item.[m
[31m-     * @param listener The listener associated with the Snackbar action.[m
[31m-     */[m
[31m-    private fun showSnackbar([m
[31m-            snackStrId: Int,[m
[31m-            actionStrId: Int = 0,[m
[31m-            listener: View.OnClickListener? = null[m
[31m-    ) {[m
[31m-        val snackbar = Snackbar.make(findViewById(android.R.id.content), getString(snackStrId),[m
[31m-                Snackbar.LENGTH_SHORT)[m
[31m-        if (actionStrId != 0 && listener != null) {[m
[31m-            snackbar.setAction(getString(actionStrId), listener)[m
[31m-        }[m
[31m-        snackbar.show()[m
[31m-    }[m
[31m-[m
[31m-    fun getlocationcode(lat: Double, long: Double) {[m
[31m-        var geoCoder: Geocoder = Geocoder(getApplicationContext(), Locale.getDefault())[m
[31m-        var address: List<Address>? = null;[m
[31m-[m
[31m-        if (geoCoder != null) {[m
[31m-            try {[m
[31m-                address = geoCoder.getFromLocation(lat, long, 1);[m
[31m-            } catch (e1: IOException) {[m
[31m-                // TODO Auto-generated catch block[m
[31m-            }[m
[31m-            if (address != null && address!!.size > 0) {[m
[31m-                postCode = address.get(0).getPostalCode();[m
[31m-            }[m
[31m-        }[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Return the current state of the permissions needed.[m
[31m-     */[m
[31m-    private fun checkPermissions() =[m
[31m-            ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED[m
[31m-[m
[31m-    private fun startLocationPermissionRequest() {[m
[31m-        ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.ACCESS_COARSE_LOCATION),[m
[31m-                REQUEST_PERMISSIONS_REQUEST_CODE)[m
[31m-    }[m
[31m-[m
[31m-    private fun requestPermissions() {[m
[31m-        if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_COARSE_LOCATION)) {[m
[31m-            showSnackbar(R.string.permission_rationale, android.R.string.ok, View.OnClickListener {[m
[31m-                // Request permission[m
[31m-                startLocationPermissionRequest()[m
[31m-            })[m
[31m-[m
[31m-        } else {[m
[31m-            startLocationPermissionRequest()[m
[31m-        }[m
[31m-    }[m
[31m-[m
[31m-    /**[m
[31m-     * Callback received when a permissions request has been completed.[m
[31m-     */[m
[31m-    override fun onRequestPermissionsResult([m
[31m-            requestCode: Int,[m
[31m-            permissions: Array<String>,[m
[31m-            grantResults: IntArray) {[m
[31m-        if (requestCode == REQUEST_PERMISSIONS_REQUEST_CODE) {[m
[31m-            when {[m
[31m-                // Permission granted.[m
[31m-                (grantResults[0] == PackageManager.PERMISSION_GRANTED) -> getLastDeviceLocation()[m
[31m-               // Permission denied.[m
[31m-                else -> {[m
[31m-                    showSnackbar(R.string.permission_denied_explanation, R.string.settings,[m
[31m-                            View.OnClickListener {[m
[31m-                                // Build intent that displays the App settings screen.[m
[31m-                                val intent = Intent().apply {[m
[31m-                                    action = Settings.ACTION_APPLICATION_DETAILS_SETTINGS[m
[31m-                                    data = Uri.fromParts("package", BuildConfig.APPLICATION_ID, null)[m
[31m-                                    flags = Intent.FLAG_ACTIVITY_NEW_TASK[m
[31m-                                }[m
[31m-                                startActivity(intent)[m
[31m-                            })[m
[31m-                }[m
[31m-            }[m
[31m-        }[m
[31m-    }[m
[31m-}[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/home/di/RestaurantSearchActivityComponent.kt b/app/src/main/kotlin/com/menulog/search/home/di/RestaurantSearchActivityComponent.kt[m
[1mdeleted file mode 100755[m
[1mindex 5bb4132..0000000[m
[1m--- a/app/src/main/kotlin/com/menulog/search/home/di/RestaurantSearchActivityComponent.kt[m
[1m+++ /dev/null[m
[36m@@ -1,15 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home.di[m
[31m-[m
[31m-import com.base.di.ActivityScope[m
[31m-import com.base.di.component.AppComponent[m
[31m-import com.burakeregar.githubsearch.home.RestaurantSearchActivity[m
[31m-[m
[31m-import dagger.Component[m
[31m-[m
[31m-@ActivityScope[m
[31m-@Component(dependencies = arrayOf(AppComponent::class),[m
[31m-        modules = arrayOf(RestaurantSearchActivityModule::class))[m
[31m-interface RestaurantSearchActivityComponent {[m
[31m-[m
[31m-    fun inject(restaurantSearchActivity: RestaurantSearchActivity)[m
[31m-}[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/home/di/RestaurantSearchActivityModule.kt b/app/src/main/kotlin/com/menulog/search/home/di/RestaurantSearchActivityModule.kt[m
[1mdeleted file mode 100755[m
[1mindex 11ec2ee..0000000[m
[1m--- a/app/src/main/kotlin/com/menulog/search/home/di/RestaurantSearchActivityModule.kt[m
[1m+++ /dev/null[m
[36m@@ -1,19 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home.di[m
[31m-[m
[31m-import com.base.di.ActivityScope[m
[31m-import com.base.util.AppSchedulerProvider[m
[31m-import com.burakeregar.githubsearch.api.Endpoints[m
[31m-import com.burakeregar.githubsearch.home.presenter.RestaurantSearchPresenter[m
[31m-import dagger.Module[m
[31m-import dagger.Provides[m
[31m-import io.reactivex.disposables.CompositeDisposable[m
[31m-[m
[31m-@Module[m
[31m-class RestaurantSearchActivityModule {[m
[31m-[m
[31m-    @Provides[m
[31m-    @ActivityScope[m
[31m-    internal fun providesRestaurantSearchPresenter(api: Endpoints, disposable: CompositeDisposable,[m
[31m-                                                   scheduler: AppSchedulerProvider):[m
[31m-            RestaurantSearchPresenter = RestaurantSearchPresenter(api, disposable, scheduler)[m
[31m-}[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/home/model/RestaurantSearchResponse.kt b/app/src/main/kotlin/com/menulog/search/home/model/RestaurantSearchResponse.kt[m
[1mdeleted file mode 100755[m
[1mindex fd6b685..0000000[m
[1m--- a/app/src/main/kotlin/com/menulog/search/home/model/RestaurantSearchResponse.kt[m
[1m+++ /dev/null[m
[36m@@ -1,150 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home.model[m
[31m-[m
[31m-[m
[31m-import com.google.gson.annotations.SerializedName[m
[31m-[m
[31m-data class LogoItem(@SerializedName("StandardResolutionURL")[m
[31m-					val standardResolutionURL: String = "")[m
[31m-[m
[31m-data class MetaData(@SerializedName("SearchedTerms")[m
[31m-					val searchedTerms: SearchedTerms,[m
[31m-					@SerializedName("TagDetails")[m
[31m-					val tagDetails: List<TagDetailsItem>?)[m
[31m-[m
[31m-[m
[31m-data class SearchedTerms(@SerializedName("CuisineSeoName")[m
[31m-						 val cuisineSeoName: String? = null,[m
[31m-						 @SerializedName("Cuisine")[m
[31m-						 val cuisine: String? = null,[m
[31m-						 @SerializedName("Phrase")[m
[31m-						 val phrase: String? = null,[m
[31m-						 @SerializedName("City")[m
[31m-						 val city: String? = null,[m
[31m-						 @SerializedName("Postcode")[m
[31m-						 val postcode: Int? = null)[m
[31m-[m
[31m-[m
[31m-data class RestaurantsItem(@SerializedName("Address")[m
[31m-						   val address: String = "",[m
[31m-						   @SerializedName("OpeningTimeIso")[m
[31m-						   val openingTimeIso: String = "",[m
[31m-						   @SerializedName("MinimumDeliveryValue")[m
[31m-						   val minimumDeliveryValue: String = "",[m
[31m-						   @SerializedName("DeliveryTimeMinutes")[m
[31m-						   val deliveryTimeMinutes: String? = null,[m
[31m-						   @SerializedName("Latitude")[m
[31m-						   val latitude: Double = 0.0,[m
[31m-						   @SerializedName("Name")[m
[31m-						   val name: String = "",[m
[31m-						   @SerializedName("SmileyUrl")[m
[31m-						   val smileyUrl: String = "",[m
[31m-						   @SerializedName("NumberOfRatings")[m
[31m-						   val numberOfRatings: Int = 0,[m
[31m-						   @SerializedName("IsOpenNow")[m
[31m-						   val isOpenNow: Boolean = false,[m
[31m-						   @SerializedName("IsOpenNowForCollection")[m
[31m-						   val isOpenNowForCollection: Boolean = false,[m
[31m-						   @SerializedName("IsPremier")[m
[31m-						   val isPremier: Boolean = false,[m
[31m-						   @SerializedName("City")[m
[31m-						   val city: String = "",[m
[31m-						   @SerializedName("Longitude")[m
[31m-						   val longitude: Double = 0.0,[m
[31m-						   @SerializedName("Postcode")[m
[31m-						   val postcode: String = "",[m
[31m-						   @SerializedName("Score")[m
[31m-						   val score: Double = 0.0,[m
[31m-						   @SerializedName("DriveInfoCalculated")[m
[31m-						   val driveInfoCalculated: Boolean = false,[m
[31m-						   @SerializedName("ReasonWhyTemporarilyOffline")[m
[31m-						   val reasonWhyTemporarilyOffline: String = "",[m
[31m-						   @SerializedName("Id")[m
[31m-						   val id: Int = 0,[m
[31m-						   @SerializedName("DeliveryOpeningTime")[m
[31m-						   val deliveryOpeningTime: String = "",[m
[31m-						   @SerializedName("UniqueName")[m
[31m-						   val uniqueName: String = "",[m
[31m-						   @SerializedName("RatingAverage")[m
[31m-						   val ratingAverage: Double = 0.0,[m
[31m-						   @SerializedName("SendsOnItsWayNotifications")[m
[31m-						   val sendsOnItsWayNotifications: Boolean = false,[m
[31m-						   @SerializedName("SmileyElite")[m
[31m-						   val smileyElite: String = "",[m
[31m-						   @SerializedName("OpeningTime")[m
[31m-						   val openingTime: String = "",[m
[31m-						   @SerializedName("IsNew")[m
[31m-						   val isNew: Boolean = false,[m
[31m-						   @SerializedName("IsCloseBy")[m
[31m-						   val isCloseBy: Boolean = false,[m
[31m-						   @SerializedName("DeliveryWorkingTimeMinutes")[m
[31m-						   val deliveryWorkingTimeMinutes: Int = 0,[m
[31m-						   @SerializedName("SponsoredPosition")[m
[31m-						   val sponsoredPosition: Int = 0,[m
[31m-						   @SerializedName("Url")[m
[31m-						   val url: String = "",[m
[31m-						   @SerializedName("RatingStars")[m
[31m-						   val ratingStars: Float = 0.0f,[m
[31m-						   @SerializedName("IsHalal")[m
[31m-						   val isHalal: Boolean = false,[m
[31m-						   @SerializedName("SmileyResult")[m
[31m-						   val smileyResult: Int = 0,[m
[31m-						   @SerializedName("IsOpenNowForDelivery")[m
[31m-						   val isOpenNowForDelivery: Boolean = false,[m
[31m-						   @SerializedName("IsTestRestaurant")[m
[31m-						   val isTestRestaurant: Boolean = false,[m
[31m-						   @SerializedName("DriveDistance")[m
[31m-						   val driveDistance: Double = 0.0,[m
[31m-						   @SerializedName("NewnessDate")[m
[31m-						   val newnessDate: String = "",[m
[31m-						   @SerializedName("DeliveryCost")[m
[31m-						   val deliveryCost: String = "",[m
[31m-						   @SerializedName("DefaultDisplayRank")[m
[31m-						   val defaultDisplayRank: Int = 0,[m
[31m-						   @SerializedName("CuisineTypes")[m
[31m-						   val cuisineTypes: List<CuisineTypesItem>?,[m
[31m-						   @SerializedName("Logo")[m
[31m-						   val logo: List<LogoItem>?,[m
[31m-						   @SerializedName("IsTemporaryBoost")[m
[31m-						   val isTemporaryBoost: Boolean = false,[m
[31m-						   @SerializedName("IsTemporarilyOffline")[m
[31m-						   val isTemporarilyOffline: Boolean = false,[m
[31m-						   @SerializedName("IsSponsored")[m
[31m-						   val isSponsored: Boolean = false,[m
[31m-						   @SerializedName("ShowSmiley")[m
[31m-						   val showSmiley: Boolean = false,[m
[31m-						   @SerializedName("DeliveryMenuId")[m
[31m-						   val deliveryMenuId: Int = 0)[m
[31m-[m
[31m-[m
[31m-data class TagDetailsItem(@SerializedName("BackgroundColour")[m
[31m-						  val backgroundColour: String = "",[m
[31m-						  @SerializedName("Priority")[m
[31m-						  val priority: Int = 0,[m
[31m-						  @SerializedName("DisplayName")[m
[31m-						  val displayName: String = "",[m
[31m-						  @SerializedName("Key")[m
[31m-						  val key: String = "",[m
[31m-						  @SerializedName("Colour")[m
[31m-						  val colour: String = "")[m
[31m-[m
[31m-[m
[31m-data class CuisineTypesItem(@SerializedName("SeoName")[m
[31m-							val seoName: String = "",[m
[31m-							@SerializedName("Id")[m
[31m-							val id: Int = 0,[m
[31m-							@SerializedName("Name")[m
[31m-							val name: String = "")[m
[31m-[m
[31m-[m
[31m-data class RestaurantList(@SerializedName("Area")[m
[31m-						 val area: String = "",[m
[31m-						  @SerializedName("ShortResultText")[m
[31m-						 val shortResultText: String = "",[m
[31m-						  @SerializedName("MetaData")[m
[31m-						 val metaData: MetaData,[m
[31m-						  @SerializedName("HasErrors")[m
[31m-						 val hasErrors: Boolean = false,[m
[31m-						  @SerializedName("Restaurants")[m
[31m-						 val restaurants: List<RestaurantsItem>?)[m
[31m-[m
[31m-[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/home/presenter/RestaurantSearchPresenter.kt b/app/src/main/kotlin/com/menulog/search/home/presenter/RestaurantSearchPresenter.kt[m
[1mdeleted file mode 100755[m
[1mindex f9ce8a4..0000000[m
[1m--- a/app/src/main/kotlin/com/menulog/search/home/presenter/RestaurantSearchPresenter.kt[m
[1m+++ /dev/null[m
[36m@@ -1,32 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home.presenter[m
[31m-[m
[31m-import com.base.mvp.BasePresenter[m
[31m-import com.base.util.SchedulerProvider[m
[31m-import com.burakeregar.githubsearch.api.Endpoints[m
[31m-import io.reactivex.disposables.CompositeDisposable[m
[31m-import javax.inject.Inject[m
[31m-[m
[31m-class RestaurantSearchPresenter @Inject constructor(var api: Endpoints, disposable:[m
[31m-CompositeDisposable, scheduler: SchedulerProvider) : BasePresenter<RestaurantSearchView>[m
[31m-(disposable, scheduler) {[m
[31m-[m
[31m-    fun getRestaurants(searchKey: String) {[m
[31m-        view?.showProgress()[m
[31m-        disposable.add(api.searchRestaurants(searchKey)[m
[31m-                .subscribeOn(scheduler.io())[m
[31m-                .observeOn(scheduler.ui())[m
[31m-                .subscribe([m
[31m-                        { result ->[m
[31m-                            view?.hideProgress()[m
[31m-                            view?.onSearchResponse(result?.restaurants)[m
[31m-                            if (result.restaurants?.size == 0) {[m
[31m-                                view?.noResult()[m
[31m-                            }[m
[31m-                        },[m
[31m-                        { _ ->[m
[31m-                            view?.hideProgress()[m
[31m-                            view?.onError()[m
[31m-                        })[m
[31m-        )[m
[31m-    }[m
[31m-}[m
\ No newline at end of file[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/home/presenter/RestaurantSearchView.kt b/app/src/main/kotlin/com/menulog/search/home/presenter/RestaurantSearchView.kt[m
[1mdeleted file mode 100755[m
[1mindex c392943..0000000[m
[1m--- a/app/src/main/kotlin/com/menulog/search/home/presenter/RestaurantSearchView.kt[m
[1m+++ /dev/null[m
[36m@@ -1,11 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home.presenter[m
[31m-[m
[31m-import com.base.mvp.BaseView[m
[31m-import com.burakeregar.githubsearch.home.model.RestaurantsItem[m
[31m-[m
[31m-interface RestaurantSearchView : BaseView {[m
[31m-    fun onSearchResponse(list: List<RestaurantsItem>?)[m
[31m-    fun showProgress()[m
[31m-    fun hideProgress()[m
[31m-    fun noResult()[m
[31m-}[m
[1mdiff --git a/app/src/main/kotlin/com/menulog/search/home/viewholder/RestaurantSearchViewHolder.kt b/app/src/main/kotlin/com/menulog/search/home/viewholder/RestaurantSearchViewHolder.kt[m
[1mdeleted file mode 100755[m
[1mindex a30f879..0000000[m
[1m--- a/app/src/main/kotlin/com/menulog/search/home/viewholder/RestaurantSearchViewHolder.kt[m
[1m+++ /dev/null[m
[36m@@ -1,37 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home.viewholder[m
[31m-[m
[31m-import android.view.View[m
[31m-import com.bumptech.glide.Glide[m
[31m-import com.burakeregar.easiestgenericrecycleradapter.base.GenericViewHolder[m
[31m-import com.burakeregar.githubsearch.home.model.RestaurantsItem[m
[31m-import kotlinx.android.synthetic.main.restaurant_item.view.*[m
[31m-import org.greenrobot.eventbus.EventBus[m
[31m-[m
[31m-class RestaurantSearchViewHolder(itemView: View?) : GenericViewHolder<Any>(itemView) {[m
[31m-    private lateinit var item: RestaurantsItem[m
[31m-[m
[31m-    override fun bindData(p0: Any?) {[m
[31m-        item = p0 as RestaurantsItem[m
[31m-        with(itemView) {[m
[31m-            tv_restaurant_name?.setBackgroundResource(android.R.color.transparent)[m
[31m-            tv_restaurant_name?.text = item.name[m
[31m-            var cuisine_firstname: String = ""[m
[31m-            if(item.cuisineTypes != null && item.cuisineTypes!!.size > 1) {[m
[31m-                cuisine_firstname = item.cuisineTypes?.get(1)?.name +", "[m
[31m-            }[m
[31m-            tv_restaurant_cuisine?.setBackgroundResource(android.R.color.transparent)[m
[31m-            tv_restaurant_cuisine?.text =  cuisine_firstname + item.cuisineTypes?.get(0)?.name[m
[31m-            tv_restaurant_totalratings?.setBackgroundResource(android.R.color.transparent)[m
[31m-            tv_restaurant_totalratings?.text = "("+item.numberOfRatings+")"[m
[31m-            restaurant_rating?.setBackgroundResource(android.R.color.transparent)[m
[31m-            restaurant_rating?.rating = item.ratingStars[m
[31m-            img_restaurant_logo?.setBackgroundResource(android.R.color.transparent)[m
[31m-            Glide.with(context)[m
[31m-                    .load(item.logo?.get(0)?.standardResolutionURL)[m
[31m-                    .into(img_restaurant_logo)[m
[31m-            restaurant_parent_layout?.setOnClickListener {[m
[31m-                EventBus.getDefault().post(item)[m
[31m-            }[m
[31m-        }[m
[31m-    }[m
[31m-}[m
\ No newline at end of file[m
[1mdiff --git a/app/src/test/kotlin/com/base/mvp/BasePresenterTest.kt b/app/src/test/kotlin/com/base/mvp/BasePresenterTest.kt[m
[1mindex ae50af4..0ced448 100755[m
[1m--- a/app/src/test/kotlin/com/base/mvp/BasePresenterTest.kt[m
[1m+++ b/app/src/test/kotlin/com/base/mvp/BasePresenterTest.kt[m
[36m@@ -9,8 +9,6 @@[m [mimport org.junit.After[m
 import org.junit.Before[m
 import org.junit.Test[m
 [m
[31m-import org.junit.Assert.*[m
[31m-[m
 class BasePresenterTest {[m
 [m
     private lateinit var basePresenter: BasePresenter<BaseView>[m
[1mdiff --git a/app/src/test/kotlin/com/menulog/search/home/presenter/RestaurantSearchPresenterTest.kt b/app/src/test/kotlin/com/menulog/search/home/presenter/RestaurantSearchPresenterTest.kt[m
[1mdeleted file mode 100755[m
[1mindex bfdf2f2..0000000[m
[1m--- a/app/src/test/kotlin/com/menulog/search/home/presenter/RestaurantSearchPresenterTest.kt[m
[1m+++ /dev/null[m
[36m@@ -1,116 +0,0 @@[m
[31m-package com.burakeregar.githubsearch.home.presenter[m
[31m-[m
[31m-import com.burakeregar.githubsearch.api.Endpoints[m
[31m-import com.burakeregar.githubsearch.home.model.RestaurantList[m
[31m-import com.burakeregar.githubsearch.home.model.RestaurantsItem[m
[31m-import com.nhaarman.mockito_kotlin.doReturn[m
[31m-import com.nhaarman.mockito_kotlin.mock[m
[31m-import com.nhaarman.mockito_kotlin.verify[m
[31m-import com.util.TestSchedulerProvider[m
[31m-import io.reactivex.Observable[m
[31m-import org.junit.Before[m
[31m-import org.junit.Test[m
[31m-import io.reactivex.schedulers.TestScheduler[m
[31m-import io.reactivex.disposables.CompositeDisposable[m
[31m-import org.junit.After[m
[31m-import org.mockito.Mockito[m
[31m-import org.mockito.Mockito.`when`[m
[31m-import org.mockito.Mockito.times[m
[31m-[m
[31m-[m
[31m-class RestaurantSearchPresenterTest {[m
[31m-[m
[31m-    private val view: RestaurantSearchView = mock()[m
[31m-    private val api: Endpoints = mock()[m
[31m-    private lateinit var presenter: RestaurantSearchPresenter[m
[31m-    private lateinit var testScheduler: TestScheduler[m
[31m-    private val searchKey: String = "se19"[m
[31m-[m
[31m-    @Before[m
[31m-    fun setup() {[m
[31m-        val compositeDisposable = CompositeDisposable()[m
[31m-        testScheduler = TestScheduler()[m
[31m-        val testSchedulerProvider = TestSchedulerProvider(testScheduler)[m
[31m-        presenter = RestaurantSearchPresenter(api, compositeDisposable, testSchedulerProvider)[m
[31m-        presenter.attachView(view)[m
[31m-    }[m
[31m-[m
[31m-    @Test[m
[31m-    fun test_getRestaurants_should_callSuccess() {[m
[31m-        val mockedResponse: RestaurantList = mock()[m
[31m-[m
[31m-        doReturn(Observable.just(mockedResponse))[m
[31m-                .`when`(api)[m
[31m-                .searchRestaurants(searchKey)[m
[31m-[m
[31m-        presenter.getRestaurants(searchKey)[m
[31m-[m
[31m-        testScheduler.triggerActions()[m
[31m-[m
[31m-        verify(view).showProgress()[m
[31m-        verify(view).onSearchResponse(mockedResponse.restaurants)[m
[31m-        verify(view).hideProgress()[m
[31m-[m
[31m-    }[m
[31m-[m
[31m-    @Test[m
[31m-    fun test_getRestaurants_shouldNot_callNoResult() {[m
[31m-        val mockedResponse: RestaurantList = mock()[m
[31m-        val items = ArrayList<RestaurantsItem>()[m
[31m-[m
[31m-        items.add(Mockito.mock(RestaurantsItem::class.java))[m
[31m-[m
[31m-        `when`(mockedResponse.restaurants).thenReturn(items)[m
[31m-[m
[31m-        doReturn(Observable.just(mockedResponse))[m
[31m-                .`when`(api)[m
[31m-                .searchRestaurants(searchKey)[m
[31m-[m
[31m-        presenter.getRestaurants(searchKey)[m
[31m-[m
[31m-        testScheduler.triggerActions()[m
[31m-[m
[31m-        verify(view, times(0)).noResult()[m
[31m-    }[m
[31m-[m
[31m-    @Test[m
[31m-    fun test_getRestaurants_should_callNoResult() {[m
[31m-        val mockedResponse: RestaurantList = mock()[m
[31m-        val items = ArrayList<RestaurantsItem>()[m
[31m-[m
[31m-        `when`(mockedResponse.restaurants).thenReturn(items)[m
[31m-[m
[31m-        doReturn(Observable.just(mockedResponse))[m
[31m-                .`when`(api)[m
[31m-                .searchRestaurants(searchKey)[m
[31m-[m
[31m-        presenter.getRestaurants(searchKey)[m
[31m-[m
[31m-        testScheduler.triggerActions()[m
[31m-[m
[31m-        verify(view).noResult()[m
[31m-    }[m
[31m-[m
[31m-    @Test[m
[31m-    fun test_getRestaurants_should_callError() {[m
[31m-        val mockedResponse: Throwable = mock()[m
[31m-[m
[31m-        doReturn(Observable.just(mockedResponse))[m
[31m-                .`when`(api)[m
[31m-                .searchRestaurants(searchKey)[m
[31m-[m
[31m-        presenter.getRestaurants(searchKey)[m
[31m-[m
[31m-        testScheduler.triggerActions()[m
[31m-[m
[31m-        verify(view).showProgress()[m
[31m-        verify(view).onError()[m
[31m-        verify(view).hideProgress()[m
[31m-    }[m
[31m-[m
[31m-    @After[m
[31m-    fun tearDown() {[m
[31m-        presenter.detachView()[m
[31m-    }[m
[31m-[m
[31m-}[m
\ No newline at end of file[m
