//
//  ForecastCell.swift
//  RxClassroom
//
//  Created by Florent Pillet on 24/09/16.
//  Copyright © 2016 Florent Pillet. All rights reserved.
//

import UIKit

class ForecastCell : UITableViewCell {
	
	@IBOutlet var cityLabel : UILabel!
	@IBOutlet var skyLabel : UILabel!
	@IBOutlet var temperatureLabel : UILabel!
	
	func configure(forecast: Forecast) {
		cityLabel.text = forecast.city
		if let conditions = forecast.forecast.first {
			skyLabel.text = String(conditions.sky)
			temperatureLabel.text = "\(conditions.temperature)° C"
		}
	}
	
}
