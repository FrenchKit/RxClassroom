//
//  MainViewModel.swift
//  RxClassroom
//
//  Created by Florent Pillet on 22/09/16.
//  Copyright © 2016 Florent Pillet. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {

	enum TableContents {
		case CityRow(Forecast)
	}

	var dateStringObservable : Observable<String> {
		return NSNotificationCenter.defaultCenter()
			.rx_notification(UIApplicationSignificantTimeChangeNotification)
			.map { _ in self.dateString() }
			.startWith(self.dateString())
	}
	
	var timeStringObservable : Observable<String> {
		return Observable<Int>.interval(1.0, scheduler: MainScheduler.instance)
			.map { _ in self.timeString() }
			.startWith(self.timeString())
	}
	
	
	var tableObservable : Observable<[TableContents]> {
		return ["Paris","Madrid","London","Berlin","Rome"].map {
			(city: String) -> Observable<TableContents> in
			self.weatherService.getForecast(city).map { TableContents.CityRow($0) }
		}
			.toObservable()
			.merge()
			.toArray()
	}

	private func dateString() -> String {
		let dateString = NSDateFormatter.localizedStringFromDate(
			NSDate(),
			dateStyle: .MediumStyle,
			timeStyle: .NoStyle)
		return dateString
	}
	
	private func timeString() -> String {
		let timeString = NSDateFormatter.localizedStringFromDate(
			NSDate(),
			dateStyle: .NoStyle,
			timeStyle: .MediumStyle)
		return timeString
	}

	
	private let weatherService : WeatherServiceType
	
	init(weatherService: WeatherServiceType) {
		self.weatherService = weatherService
	}

}
