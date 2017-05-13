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

    var _date: String!
    var _weatherType: String!
    var _highTemp: Double!
    var _lowTemp: Double!

    
    var date: String{
        // Prevent Crashing
        if _date == nil{
            _date = ""
        }
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
    
    init(weatherDict: Dictionary<String,AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String,AnyObject>{
            if let min = temp["min"] as? Double{
                let kelvinToFarenheitPreDivision  = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                self._lowTemp = kelvinToFarenheit
            }
            
            if let max = temp["max"] as? Double{
                let kelvinToFarenheitPreDivision  = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._highTemp = kelvinToFarenheit
                print(self._highTemp)
            }
        }
        
        if let weather  = weatherDict["weather"] as? [Dictionary<String,AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double{
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .none
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            self._date = unixConvertedDate.dayOfTheWeek()
            
        }
    }
}


extension Date{
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // I want the fullname the day of the week
        return dateFormatter.string(from: self)
        
    }
}
