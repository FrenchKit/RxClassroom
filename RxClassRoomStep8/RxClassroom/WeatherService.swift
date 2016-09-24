//
//  WeatherService.swift
//  RxClassroom
//
//  Created by Florent Pillet on 24/09/16.
//  Copyright © 2016 Florent Pillet. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum WeatherError : ErrorType {
	case InvalidURL(String)
}

class WeatherService : WeatherServiceType {
	private struct Constants {
		static let APP_ID = "6a700a1e919dc96b0a98901c9f4bec47"
		static let API_URL = "http://api.openweathermap.org/data/2.5/weather"
	}
	
	func getForecast(city: String) -> Observable<Forecast> {
		let query = "\(Constants.API_URL)?units=metric&APPID=\(Constants.APP_ID)&q=\(city)"
		guard let url = NSURL(string: query) else {
			return Observable.error(WeatherError.InvalidURL(query))
		}
		let urlRequest = NSURLRequest(URL: url)
		
		return NSURLSession.sharedSession()
			.rx_JSON(urlRequest)
			.map { json in
				guard let main = json["main"] as? [String:AnyObject],
				let temp = main["temp"] as? Float else {
					return Forecast(city: city, forecast: [])
				}
				// TODO: decode the sky info
				let conditions = Conditions(time: NSDate(), temperature: Int(temp), sky: .Clear)
				return Forecast(city: city, forecast: [conditions])
		}
	}
}
