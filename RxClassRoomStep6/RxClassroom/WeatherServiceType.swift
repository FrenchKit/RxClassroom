//
//  WeatherService.swift
//  RxClassroom
//

import Foundation
import RxSwift

protocol WeatherServiceType {
	
	func getForecast(city: String) -> Observable<Forecast>

}
