package com.menulog.search.model


import com.google.gson.annotations.SerializedName

data class LogoItem(@SerializedName("StandardResolutionURL")
					val standardResolutionURL: String = "")

data class MetaData(@SerializedName("SearchedTerms")
					val searchedTerms: SearchedTerms,
					@SerializedName("TagDetails")
					val tagDetails: List<TagDetailsItem>?)


data class SearchedTerms(@SerializedName("CuisineSeoName")
						 val cuisineSeoName: String? = null,
						 @SerializedName("Cuisine")
						 val cuisine: String? = null,
						 @SerializedName("Phrase")
						 val phrase: String? = null,
						 @SerializedName("City")
						 val city: String? = null,
						 @SerializedName("Postcode")
						 val postcode: Int? = null)


data class RestaurantsItem(@SerializedName("Address")
						   val address: String = "",
						   @SerializedName("OpeningTimeIso")
						   val openingTimeIso: String = "",
						   @SerializedName("MinimumDeliveryValue")
						   val minimumDeliveryValue: String = "",
						   @SerializedName("DeliveryTimeMinutes")
						   val deliveryTimeMinutes: String? = null,
						   @SerializedName("Latitude")
						   val latitude: Double = 0.0,
						   @SerializedName("Name")
						   val name: String = "",
						   @SerializedName("SmileyUrl")
						   val smileyUrl: String = "",
						   @SerializedName("NumberOfRatings")
						   val numberOfRatings: Int = 0,
						   @SerializedName("IsOpenNow")
						   val isOpenNow: Boolean = false,
						   @SerializedName("IsOpenNowForCollection")
						   val isOpenNowForCollection: Boolean = false,
						   @SerializedName("IsPremier")
						   val isPremier: Boolean = false,
						   @SerializedName("City")
						   val city: String = "",
						   @SerializedName("Longitude")
						   val longitude: Double = 0.0,
						   @SerializedName("Postcode")
						   val postcode: String = "",
						   @SerializedName("Score")
						   val score: Double = 0.0,
						   @SerializedName("DriveInfoCalculated")
						   val driveInfoCalculated: Boolean = false,
						   @SerializedName("ReasonWhyTemporarilyOffline")
						   val reasonWhyTemporarilyOffline: String = "",
						   @SerializedName("Id")
						   val id: Int = 0,
						   @SerializedName("DeliveryOpeningTime")
						   val deliveryOpeningTime: String = "",
						   @SerializedName("UniqueName")
						   val uniqueName: String = "",
						   @SerializedName("RatingAverage")
						   val ratingAverage: Double = 0.0,
						   @SerializedName("SendsOnItsWayNotifications")
						   val sendsOnItsWayNotifications: Boolean = false,
						   @SerializedName("SmileyElite")
						   val smileyElite: String = "",
						   @SerializedName("OpeningTime")
						   val openingTime: String = "",
						   @SerializedName("IsNew")
						   val isNew: Boolean = false,
						   @SerializedName("IsCloseBy")
						   val isCloseBy: Boolean = false,
						   @SerializedName("DeliveryWorkingTimeMinutes")
						   val deliveryWorkingTimeMinutes: Int = 0,
						   @SerializedName("SponsoredPosition")
						   val sponsoredPosition: Int = 0,
						   @SerializedName("Url")
						   val url: String = "",
						   @SerializedName("RatingStars")
						   val ratingStars: Float = 0.0f,
						   @SerializedName("IsHalal")
						   val isHalal: Boolean = false,
						   @SerializedName("SmileyResult")
						   val smileyResult: Int = 0,
						   @SerializedName("IsOpenNowForDelivery")
						   val isOpenNowForDelivery: Boolean = false,
						   @SerializedName("IsTestRestaurant")
						   val isTestRestaurant: Boolean = false,
						   @SerializedName("DriveDistance")
						   val driveDistance: Double = 0.0,
						   @SerializedName("NewnessDate")
						   val newnessDate: String = "",
						   @SerializedName("DeliveryCost")
						   val deliveryCost: String = "",
						   @SerializedName("DefaultDisplayRank")
						   val defaultDisplayRank: Int = 0,
						   @SerializedName("CuisineTypes")
						   val cuisineTypes: List<CuisineTypesItem>?,
						   @SerializedName("Logo")
						   val logo: List<LogoItem>?,
						   @SerializedName("IsTemporaryBoost")
						   val isTemporaryBoost: Boolean = false,
						   @SerializedName("IsTemporarilyOffline")
						   val isTemporarilyOffline: Boolean = false,
						   @SerializedName("IsSponsored")
						   val isSponsored: Boolean = false,
						   @SerializedName("ShowSmiley")
						   val showSmiley: Boolean = false,
						   @SerializedName("DeliveryMenuId")
						   val deliveryMenuId: Int = 0)


data class TagDetailsItem(@SerializedName("BackgroundColour")
						  val backgroundColour: String = "",
						  @SerializedName("Priority")
						  val priority: Int = 0,
						  @SerializedName("DisplayName")
						  val displayName: String = "",
						  @SerializedName("Key")
						  val key: String = "",
						  @SerializedName("Colour")
						  val colour: String = "")


data class CuisineTypesItem(@SerializedName("SeoName")
							val seoName: String = "",
							@SerializedName("Id")
							val id: Int = 0,
							@SerializedName("Name")
							val name: String = "")


data class RestaurantList(@SerializedName("Area")
						 val area: String = "",
						  @SerializedName("ShortResultText")
						 val shortResultText: String = "",
						  @SerializedName("MetaData")
						 val metaData: MetaData,
						  @SerializedName("HasErrors")
						 val hasErrors: Boolean = false,
						  @SerializedName("Restaurants")
						 val restaurants: List<RestaurantsItem>?)


