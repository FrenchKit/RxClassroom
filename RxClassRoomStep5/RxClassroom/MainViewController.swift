//
//  MainViewController.swift
//  RxClassroom
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

	@IBOutlet var dateLabel : UILabel!           // A date label we want to update with the current date
	@IBOutlet var timeLabel : UILabel!           // A time label we want to update every second
	var disposeBag : DisposeBag?

	private var model : MainViewModel!           // the ViewModel that drives the logic for this ViewController
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let app : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		model = MainViewModel(weatherService: app.weatherService)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		bindViewModel()
	}
	
	override func viewDidDisappear(animated: Bool) {
		super.viewDidDisappear(animated)
		unbindViewModel()
	}
	
	private func bindViewModel() {
		let bag = DisposeBag()
		model.dateStringObservable.bindTo(dateLabel.rx_text).addDisposableTo(bag)
		model.timeStringObservable.bindTo(timeLabel.rx_text).addDisposableTo(bag)
		self.disposeBag = bag
	}
	
	private func unbindViewModel() {
		disposeBag = nil
	}
}

