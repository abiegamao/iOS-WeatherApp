//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Abz Maxey on 13/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(forecast: Forecast)  {
        lowTempLabel.text = "\(forecast.lowTemp)"
        highTempLabel.text = "\(forecast.highTemp)"
        weatherTypeLabel.text = forecast.weatherType
        dayOfTheWeekLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
        weatherIcon.contentMode = .scaleAspectFit
        
    }

}
