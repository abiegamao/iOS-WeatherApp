//
//  Forecast.swift
//  WeatherApp
//
//  Created by Abz Maxey on 12/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _highTemp: Double!
    var _lowTemp: Double!
    
    var cityName: String{
        // Prevent Crashing
        if _cityName == nil{
            _cityName = "Sample"
        }
        return _cityName
    }
    
    
    var date: String{
        // Prevent Crashing
        if _date == nil{
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none // We dont need time
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today is, \(currentDate)"
        return _date
    }
    
    var weatherType: String{
        // Prevent Crashing
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    
    var highTemp: Double{
        // Prevent Crashing
        if _highTemp == nil{
            _highTemp = 0.0
        }
        return _highTemp
        
    }
    
    var lowTemp: Double{
        // Prevent Crashing
        if _lowTemp == nil{
            _lowTemp = 0.0
        }
        return _lowTemp
        
    }


    
}
