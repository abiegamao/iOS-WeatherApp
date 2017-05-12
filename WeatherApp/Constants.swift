//
//  Constants.swift
//  WeatherApp
//
//  Created by Abz Maxey on 12/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "e55d26e770add10f899821e27672e402"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"


