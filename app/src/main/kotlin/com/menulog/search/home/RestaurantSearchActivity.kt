package com.burakeregar.githubsearch.home

import android.Manifest
import android.annotation.SuppressLint
import android.content.Intent
import android.content.pm.PackageManager
import android.location.Address
import android.location.Geocoder
import android.net.Uri
import android.os.Bundle
import android.provider.Settings
import android.support.design.widget.Snackbar
import android.support.v4.app.ActivityCompat
import android.support.v7.widget.LinearLayoutManager
import android.view.View
import com.base.BaseActivity
import com.burakeregar.githubsearch.R
//import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityModule
import com.burakeregar.githubsearch.home.presenter.RestaurantSearchPresenter
import com.burakeregar.githubsearch.home.presenter.RestaurantSearchView
import com.burakeregar.githubsearch.home.viewholder.RestaurantSearchViewHolder
import com.burakeregar.easiestgenericrecycleradapter.base.GenericAdapterBuilder
import com.burakeregar.easiestgenericrecycleradapter.base.GenericRecyclerAdapter
import com.burakeregar.githubsearch.home.model.*
import com.mancj.materialsearchbar.MaterialSearchBar
import kotlinx.android.synthetic.main.restaurant_activity.*
import org.greenrobot.eventbus.Subscribe
import org.jetbrains.anko.toast
import javax.inject.Inject
import android.view.inputmethod.InputMethodManager
import com.base.RestaurantSearchApp
import com.burakeregar.githubsearch.BuildConfig
import com.burakeregar.githubsearch.home.di.DaggerRestaurantSearchActivityComponent
import com.burakeregar.githubsearch.home.di.RestaurantSearchActivityModule
//import com.burakeregar.githubsearch.home.di.DaggerRestaurantSearchActivityComponent
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import java.io.IOException
import java.util.*


class RestaurantSearchActivity : BaseActivity(), RestaurantSearchView,
        MaterialSearchBar.OnSearchActionListener {

    @Inject
    lateinit var presenter: RestaurantSearchPresenter
    private val REQUEST_PERMISSIONS_REQUEST_CODE = 34

    /**
     * Provides the entry point to the Fused Location Provider API.
     */
    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private var postCode: String = ""

    private lateinit var recyclerAdapter: GenericRecyclerAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.restaurant_activity)
        postCode = getString(R.string.default_postcode)
        fusedLocationClient = LocationServices.getFusedLocationProviderClient(this)
        initAdapter()
        initSearchView()
    }

    /**
     * Method to init the RecyclerView and Adapter class.
     *
     */
    private fun initAdapter() {
        recyclerAdapter = GenericAdapterBuilder().addModel(
                R.layout.restaurant_item,
                RestaurantSearchViewHolder::class.java,
                RestaurantsItem::class.java)
                .execute()

        with(restaurant_recylerview) {
            layoutManager = LinearLayoutManager(this@RestaurantSearchActivity)
            adapter = recyclerAdapter
        }
    }

    /**
     * Method to init the configure the SearchBar Tab.
     *
     */
    private fun initSearchView() {
        with(restaurant_SearchView) {
            setHint(getString(R.string.restaurantsearch_hint))
            setSpeechMode(false)
            setOnSearchActionListener(this@RestaurantSearchActivity)
            restaurant_SearchView?.text = postCode
            restaurant_SearchView.enableSearch()
        }
    }

    override fun onActivityInject() {
        DaggerRestaurantSearchActivityComponent.builder().appComponent(getAppcomponent())
                .restaurantSearchActivityModule(RestaurantSearchActivityModule())
                .build()
                .inject(this)
        /*(application as RestaurantSearchApp).component().inject(this)*/

        presenter.attachView(this)
    }

    override fun onSearchResponse(list: List<RestaurantsItem>?) {
        if(list?.size != 0)
            recyclerAdapter.setList(list)
    }

    override fun showProgress() {
        restaurant_notificationcard.visibility = View.GONE
        restaurant_recylerview.visibility = View.GONE
        restaurant_Shimmer.visibility = View.VISIBLE
        restaurant_Shimmer.startShimmerAnimation()
    }

    override fun hideProgress() {
        restaurant_recylerview.visibility = View.VISIBLE
        restaurant_Shimmer.visibility = View.GONE
        restaurant_Shimmer.stopShimmerAnimation()
    }

    override fun onButtonClicked(buttonCode: Int) {}

    override fun onSearchStateChanged(enabled: Boolean) {}

    override fun onSearchConfirmed(text: CharSequence?) {
        presenter.getRestaurants(text?.toString() ?: "")
        val view = this.currentFocus
        if (view != null) {
            val imm = getSystemService(INPUT_METHOD_SERVICE) as InputMethodManager
            imm.hideSoftInputFromWindow(view.windowToken, 0)
        }
    }

    override fun noResult() {
        restaurant_recylerview.visibility = View.GONE
        restaurant_notificationcard.visibility = View.VISIBLE
        restaurant_result_message.text = getString(R.string.no_restaurants_found)
        toast(getString(R.string.no_restaurants_found))
    }

    override fun onDestroy() {
        super.onDestroy()
    }

    /**
     * Shows a toast of the Item clicked in the Recyclerview.
     *
     * @param item The list view Item which got selected.
     */
    @Subscribe
    fun onRowClicked(item: RestaurantsItem) {
        toast("${getString(R.string.restaurant_name)} ${item.name}")
    }

    override fun onStart() {
        super.onStart()

        if (!checkPermissions()) {
            requestPermissions()
        } else {
            getLastDeviceLocation()
        }
    }

    /**
     * Provides a simple way of getting a device's location and is well suited for
     * applications that do not require a fine-grained location and that do not need location
     * updates.
     */
    @SuppressLint("MissingPermission")
    private fun getLastDeviceLocation() {
        fusedLocationClient.lastLocation
                .addOnCompleteListener(this) { task ->
                    if (task.isSuccessful && task.result != null) {
                        getlocationcode(task.result.latitude,task.result.longitude)
                    } else {
                        showSnackbar(R.string.no_location_detected)
                    }
                }
    }

    /**
     * Shows a [Snackbar].
     *
     * @param snackStrId The id for the string resource for the Snackbar text.
     * @param actionStrId The text of the action item.
     * @param listener The listener associated with the Snackbar action.
     */
    private fun showSnackbar(
            snackStrId: Int,
            actionStrId: Int = 0,
            listener: View.OnClickListener? = null
    ) {
        val snackbar = Snackbar.make(findViewById(android.R.id.content), getString(snackStrId),
                Snackbar.LENGTH_SHORT)
        if (actionStrId != 0 && listener != null) {
            snackbar.setAction(getString(actionStrId), listener)
        }
        snackbar.show()
    }

    fun getlocationcode(lat: Double, long: Double) {
        var geoCoder: Geocoder = Geocoder(getApplicationContext(), Locale.getDefault())
        var address: List<Address>? = null;

        if (geoCoder != null) {
            try {
                address = geoCoder.getFromLocation(lat, long, 1);
            } catch (e1: IOException) {
                // TODO Auto-generated catch block
            }
            if (address != null && address!!.size > 0) {
                postCode = address.get(0).getPostalCode();
            }
        }
    }

    /**
     * Return the current state of the permissions needed.
     */
    private fun checkPermissions() =
            ActivityCompat.checkSelfPermission(this, Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED

    private fun startLocationPermissionRequest() {
        ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.ACCESS_COARSE_LOCATION),
                REQUEST_PERMISSIONS_REQUEST_CODE)
    }

    private fun requestPermissions() {
        if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_COARSE_LOCATION)) {
            showSnackbar(R.string.permission_rationale, android.R.string.ok, View.OnClickListener {
                // Request permission
                startLocationPermissionRequest()
            })

        } else {
            startLocationPermissionRequest()
        }
    }

    /**
     * Callback received when a permissions request has been completed.
     */
    override fun onRequestPermissionsResult(
            requestCode: Int,
            permissions: Array<String>,
            grantResults: IntArray) {
        if (requestCode == REQUEST_PERMISSIONS_REQUEST_CODE) {
            when {
                // Permission granted.
                (grantResults[0] == PackageManager.PERMISSION_GRANTED) -> getLastDeviceLocation()
               // Permission denied.
                else -> {
                    showSnackbar(R.string.permission_denied_explanation, R.string.settings,
                            View.OnClickListener {
                                // Build intent that displays the App settings screen.
                                val intent = Intent().apply {
                                    action = Settings.ACTION_APPLICATION_DETAILS_SETTINGS
                                    data = Uri.fromParts("package", BuildConfig.APPLICATION_ID, null)
                                    flags = Intent.FLAG_ACTIVITY_NEW_TASK
                                }
                                startActivity(intent)
                            })
                }
            }
        }
    }
}
