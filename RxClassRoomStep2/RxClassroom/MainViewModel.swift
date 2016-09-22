//
//  MainViewModel.swift
//  RxClassroom
//
//  Created by Florent Pillet on 22/09/16.
//  Copyright © 2016 Florent Pillet. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel {

	var dateStringObservable : Observable<String> {
		let dateString = NSDateFormatter.localizedStringFromDate(
			NSDate(),
			dateStyle: .MediumStyle,
			timeStyle: .NoStyle)
		
		return Observable.just(dateString)
	}

	var timeStringObservable : Observable<String> {
		let timeString = NSDateFormatter.localizedStringFromDate(
			NSDate(),
			dateStyle: .NoStyle,
			timeStyle: .MediumStyle)
		
		return Observable.just(timeString)
	}
}
