//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Abz Maxey on 12/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import UIKit
import Alamofire



class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!


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
    
    
    var currentTemp: Double{
        // Prevent Crashing
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
        
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        //Alamofire Download
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON {
            response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                    print(self._cityName)
                    
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let temp = main["temp"] as? Double{
                        let kelvinToFarenheitPreDivision  = (temp * (9/5) - 459.67)
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        self._currentTemp = kelvinToFarenheit
                        print(self._currentTemp)
                    }
                    
                }
            }
            completed()
        }
        
    }
    

    
    
}
