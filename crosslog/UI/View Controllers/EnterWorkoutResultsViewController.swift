//
//  EnterWorkoutResultsView.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 24.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import SnapKit
import RMPickerViewController

private let kPickerComponentWidth: CGFloat = 100

protocol EnterWorkoutResultsViewControllerDelegate: AnyObject {
    func workoutResultsControllerDidEnterResults(controller: EnterWorkoutResultsViewController)
}

class EnterWorkoutResultsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet private weak var timeButton: UIButton!
    @IBOutlet private weak var workoutTitleLabel: UILabel!

    weak var delegate: EnterWorkoutResultsViewControllerDelegate? = nil
    var workout: Workout! = nil {
        didSet {
            // TODO: Setup content
        }
    }
    private var resultMinutes: Int = 0
    private var resultSeconds: Int = 0
    
    // MARK: - Initialization
    required convenience init(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }
    
    init(_ coder: NSCoder? = nil) {
        if let coder = coder {
            super.init(coder: coder)!
        }
        else {
            super.init(nibName: nil, bundle:nil)
        }
    }
    
    convenience init(workout: Workout) {
        self.init()
        self.workout = workout
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTimeButton()

        var title = workout.title
        if title == nil {
            title = "WOD " + "\(workout.training!.workouts!.indexOfObject(workout) + 1)"
        }
        workoutTitleLabel.text = title
    }
    
    // MARK: - Utils
    func setupTimeButton() {
        let titleString = String(format: "%02d", resultMinutes) + ":" +  String(format: "%02d", resultSeconds)
        timeButton.setTitle(titleString, forState: UIControlState.Normal)
    }
    
    func resultTime() -> Int {
        return resultMinutes * 60 + resultSeconds
    }
    
    // MARK: - Actions
    @IBAction func actionSelectTime(sender: UIButton) {
        
        let selectAction = RMAction(title: "OK", style:.Done, andHandler:{(controller: RMActionController) in
            let pickerView = (controller as! RMPickerViewController).picker
            self.resultMinutes = pickerView.selectedRowInComponent(0)
            self.resultSeconds = pickerView.selectedRowInComponent(1)
            self.setupTimeButton()
        })
        let cancelAction = RMAction(title: "Cancel", style:.Cancel, andHandler:nil)

        let pickerController = RMPickerViewController(style: .White, selectAction: selectAction, andCancelAction: cancelAction)
        pickerController!.disableBouncingEffects = true
        self.presentViewController(pickerController!, animated: true, completion: nil)

        // picker view setup
        let pickerView = pickerController!.picker
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(resultMinutes, inComponent: 0, animated: false)
        pickerView.selectRow(resultSeconds, inComponent: 1, animated: false)
        
        let minutesLabel = UILabel()
        minutesLabel.text = "Mins"
        minutesLabel.sizeToFit()
        pickerView.addSubview(minutesLabel)
        minutesLabel.snp_makeConstraints(closure: {(make: ConstraintMaker) in
            make.centerY.equalTo(minutesLabel.superview!)
            make.centerX.equalTo(minutesLabel.superview!).offset(-20)
            make.size.equalTo(minutesLabel.frame.size)
        })
        
        let secondsLabel = UILabel()
        secondsLabel.text = "Secs"
        secondsLabel.sizeToFit()
        pickerView.addSubview(secondsLabel)
        secondsLabel.snp_makeConstraints(closure: {(make: ConstraintMaker) in
            make.centerY.equalTo(secondsLabel.superview!)
            make.centerX.equalTo(secondsLabel.superview!).offset(85)
            make.size.equalTo(secondsLabel.frame.size)
        })
    }
    
    @IBAction func actionSave(sender: UIButton) {
        delegate?.workoutResultsControllerDidEnterResults(self)
    }
    
    // MARK: - UIPickerView delegate & datasource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 99 // 99 minutes
        } else {
            return 60 // 60 seconds
        }
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Right
        paragraphStyle.tailIndent = kPickerComponentWidth / 2
        return NSAttributedString(string: String(format: "%02d", row), attributes: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return kPickerComponentWidth
    }
}