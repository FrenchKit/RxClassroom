//
//  Weather.swift
//  RxClassroom
//

import Foundation

enum Sky {
	case Clear
	case Windy
	case PartlyCloudy
	case Cloudy
	case Rainy
}

struct Conditions {
	let time : NSDate
	let temperature : Int
	let sky : Sky
}

struct Forecast {
	let city : String
	let forecast : [Conditions]
}
