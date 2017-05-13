//
//  ViewController.swift
//  WeatherApp
//
//  Created by Abz Maxey on 11/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation


class WeatherVC: UIViewController, UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentCity: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation!
    
    var currentWeather : CurrentWeather!
    var foreCast: Forecast!
    var foreCasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        // Do any additional setup after loading the view, typically from a nib.
        currentWeather = CurrentWeather()
       // foreCast = Forecast()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
           
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            currentWeather.downloadWeatherDetails {
                //set up ui
                self.downloadForeCastData {
                    self.updateMainUI()
                }
            }
            print(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude)
        }
        else{
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foreCasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell{
            let forecast = foreCasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell;
        }else{
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        currentCity.text = currentWeather.cityName
        currentTempLabel.text = "\(currentWeather.currentTemp)°"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        dateLabel.text = currentWeather.date
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        currentWeatherImage.contentMode = .scaleAspectFill
    }
    
    func downloadForeCastData(completed: @escaping DownloadComplete)  {
        //download data for tableview
        Alamofire.request(FORECAST_URL).responseJSON{ response in
        
        let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                    print(list)
                    for obj in list{
                        let forecast = Forecast(weatherDict: obj)
                        self.foreCasts.append(forecast)
                        print(obj)
                        
                        //if let temp = list[obj]["temp"] as? Dictionary<String,AnyObject>{
                    }
                }
                self.foreCasts.remove(at: 0)
                self.tableView.reloadData()
            }
            completed()
        }
    }
}

