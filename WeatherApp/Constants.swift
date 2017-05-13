//
//  Constants.swift
//  WeatherApp
//
//  Created by Abz Maxey on 12/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "e55d26e770add10f899821e27672e402"

typealias DownloadComplete = () -> ()

let lati = Location.sharedInstance.latitude
let longi = Location.sharedInstance.longitude

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(API_KEY)"

let FORECAST_URL = "\(BASE_URL_FORECAST)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)&cnt=10\(APP_ID)\(API_KEY)"


