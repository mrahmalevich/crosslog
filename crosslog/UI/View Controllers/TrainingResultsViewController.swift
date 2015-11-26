//
//  TrainingResultsViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 24.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import MagicalRecord
import SnapKit

private let kResultCellReuseID: String = "kTrainingResultCell"

class TrainingResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerDynamicContentView: UIView!
    
    var training: Training! = nil
    var resultsDataController: TrainingResultsDataController! = nil
    var resultsFetchController: NSFetchedResultsController! = nil
    var initialized = false
    
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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsDataController = TrainingResultsDataController(training: training)
        self.resultsFetchController = TrainingResult.MR_fetchAllGroupedBy(nil, withPredicate: NSPredicate(format: "training = %@", training), sortedBy: "user.firstName,user.lastName", ascending: true, delegate: self)
        tableView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !initialized {
            initialized = true
            
            // Setup header
            let workoutsCount = training.workouts != nil ? training.workouts!.count : 0
            var prevLabel: UILabel? = nil
            for var i = 0; i < workoutsCount; i++ {
                let itemLabel: UILabel = UILabel()
                itemLabel.font = Stylesheet.commonFontOfSize(17.0)
                itemLabel.textAlignment = .Center
                itemLabel.text = "WOD" + (workoutsCount > 1 ? " \(i + 1)" : "")
                itemLabel.textColor = UIColor.blackColor()
                itemLabel.backgroundColor = UIColor.clearColor()
                headerDynamicContentView.addSubview(itemLabel)
                itemLabel.snp_makeConstraints(closure: {(make: ConstraintMaker) in
                    make.top.equalTo(0)
                    make.bottom.equalTo(0)
                    make.width.equalTo(100)
                    if prevLabel == nil {
                        make.left.equalTo(0)
                    } else {
                        make.left.equalTo(prevLabel!.snp_right)
                    }
                    make.width.equalTo(headerDynamicContentView).multipliedBy(1/Float(workoutsCount))
                })
                itemLabel.layoutIfNeeded()
                
                prevLabel = itemLabel
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    // MARK: - UITableView delegate & datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsFetchController.fetchedObjects!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kResultCellReuseID, forIndexPath: indexPath) as! TrainingResultsCell
        let result = resultsFetchController.fetchedObjects![indexPath.row] as! TrainingResult
        cell.result = result
        return cell
    }
    
    // MARK: - NSFetchedResultsController delegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
}