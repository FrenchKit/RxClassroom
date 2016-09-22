//
//  MainViewController.swift
//  RxClassroom
//

import UIKit
import RxCocoa

class MainViewController: UIViewController {

	@IBOutlet var dateLabel : UILabel!           // A date label we want to update with the current date
	@IBOutlet var timeLabel : UILabel!           // A time label we want to update every second

	private var model : MainViewModel!           // the ViewModel that drives the logic for this ViewController
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		model = MainViewModel()
		bindViewModel()
	}
	
	private func bindViewModel() {
		
		model.dateStringObservable.bindTo(dateLabel.rx_text)
		model.timeStringObservable.bindTo(timeLabel.rx_text)
	}
}

