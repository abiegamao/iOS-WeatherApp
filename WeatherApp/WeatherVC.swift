//
//  ViewController.swift
//  WeatherApp
//
//  Created by Abz Maxey on 11/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import UIKit
import Alamofire


class WeatherVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var currentCity: UILabel!
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather : CurrentWeather!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            //set up ui
            self.updateMainUI()
        
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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI() {
        currentCity.text = currentWeather.cityName
        currentTempLabel.text = "\(currentWeather.currentTemp)°"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        dateLabel.text = currentWeather.date
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        currentWeatherImage.contentMode = .scaleAspectFill
    }
    
    


}

