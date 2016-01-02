//
//  ChooseProtocolViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

class ChooseProtocolViewController: UITableViewController {
    let tableModel = [ ["RFT":WorkoutType.RFT],
                       ["RFT Varying Reps":WorkoutType.Chipper],
                       ["Chipper":WorkoutType.Chipper],
                       ["EMOM":WorkoutType.EMOM],
                       ["TABATA":WorkoutType.TABATA],
                       ["FGB Style":WorkoutType.FGBStyle],
                       ["Composite Workout":WorkoutType.Composite] ]
    
    var showCompositeWorkout: Bool = true {
        didSet {
            tableView.reloadData()
        }
    }
    
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
    
    // MARK: - View Lifecycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - UITableView delegate & datasource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showCompositeWorkout ? tableModel.count : tableModel.count - 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let valueDict = tableModel[indexPath.row]
        let title = valueDict.keys.first!
        let cell = tableView.dequeueReusableCellWithIdentifier("ProtocolCell")!
        cell.textLabel!.text = title
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let valueDict = tableModel[indexPath.row]
        let workoutType = valueDict.values.first!
        WorkoutConstructorDataController.sharedInstance.createWorkoutWithType(workoutType)
        if workoutType == .Composite {
            self.performSegueWithIdentifier("ShowCompositeWorkoutConstructorSegue", sender: self)
        } else {
            self.performSegueWithIdentifier("ShowWorkoutConstructorSegue", sender: self)
        }
    }
}