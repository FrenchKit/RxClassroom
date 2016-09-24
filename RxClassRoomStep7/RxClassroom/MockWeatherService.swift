//
//  MockWeatherService.swift
//  RxClassroom
//
//  Created by Florent Pillet on 22/09/16.

import Foundation
import RxSwift

extension Sky {
	static func random() -> Sky {
		let all : [Sky] = [.Clear, .Windy, .PartlyCloudy, .Cloudy, .Rainy]
		return all[Int(arc4random()) % all.count]
	}
}

class MockWeatherService : WeatherServiceType {
	
	func getForecast(city: String) -> Observable<Forecast> {
		// generate a random forecast for the next 24 hours
		let forecast = [0 ... 23].enumerate().map { (hour,_) in
			return Conditions(
				time: NSDate().dateByAddingTimeInterval(NSTimeInterval(hour) * 3600.0),
				temperature: 17 + Int(arc4random()) % 6,
				sky: Sky.random())
		}
		return Observable.just(Forecast(city: city, forecast: forecast))
	}

}
