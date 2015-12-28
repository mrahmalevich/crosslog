//
//  ChooseProtocolViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

class ChooseProtocolViewController: UITableViewController {
    
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
        return showCompositeWorkout ? 8 : 7
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == tableView.numberOfRowsInSection(0) - 1 {
            self.performSegueWithIdentifier("ShowCompositeWorkoutConstructorSegue", sender: self)
        } else {
            self.performSegueWithIdentifier("ShowWorkoutConstructorSegue", sender: self)
        }
    }
}