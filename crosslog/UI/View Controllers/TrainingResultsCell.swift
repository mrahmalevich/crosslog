//
//  TrainingResultsCell.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 25.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import SnapKit

class TrainingResultsCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dynamicContentContainer: UIView!
    
    var result: TrainingResult! = nil {
        didSet {
            nameLabel.text = result.user!.fullName()
            
            var prevLabel: UILabel? = nil
            let training = result.training!
            let workouts = training.workouts!
            for var i = 0; i < workouts.count; i++ {
                
                // find user's result for workout
                let workout = workouts[i] as! Workout
                let workoutResult = result.workoutResults!.filter({(element: WorkoutResult) in
                    element.workout == workout
                }).first

                // generate result string
                let resultText: String
                if workoutResult != nil {
                    let resultMinutes = workoutResult!.time!.integerValue / 60
                    let resultSeconds = workoutResult!.time!.integerValue % 60
                    resultText = String(format: "%02d", resultMinutes) + ":" + String(format: "%02d", resultSeconds)
                } else {
                    resultText = "-"
                }
                
                // create label
                let itemLabel: UILabel = UILabel()
                itemLabel.font = Stylesheet.commonFontOfSize(13.0)
                itemLabel.textAlignment = .Center
                itemLabel.text = resultText
                itemLabel.textColor = UIColor.blackColor()
                itemLabel.backgroundColor = UIColor.clearColor()
                dynamicContentContainer.addSubview(itemLabel)
                itemLabel.snp_makeConstraints(closure: {(make: ConstraintMaker) in
                    make.top.equalTo(0)
                    make.bottom.equalTo(0)
                    make.width.equalTo(100)
                    if prevLabel == nil {
                        make.left.equalTo(0)
                    } else {
                        make.left.equalTo(prevLabel!.snp_right)
                    }
                    make.width.equalTo(dynamicContentContainer).multipliedBy(1/Float(workouts.count))
                })
                itemLabel.layoutIfNeeded()

                prevLabel = itemLabel
            }
        }
    }
}