//
//  ProfileViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 22.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import MagicalRecord

private let kFeedCellReuseID: String = "kFeedCell"

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    @IBOutlet private weak var tableView: UITableView!

    var user: User! = nil
    private let sessionsController: NSFetchedResultsController
    
    // MARK: - Initialization
    required convenience init(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }
    
    init(_ coder: NSCoder? = nil) {
        self.sessionsController = TrainingResult.MR_fetchAllSortedBy("training.date", ascending: false, withPredicate: nil, groupBy: nil, delegate: nil)
        
        if let coder = coder {
            super.init(coder: coder)!
        }
        else {
            super.init(nibName: nil, bundle:nil)
        }
        
        self.sessionsController.delegate = self
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileHeader = tableView.tableHeaderView! as! ProfileHeaderView
        profileHeader.user = UserService.sharedInstance.authorizedUser!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "ShowTrainingSegue") {
            let trainingViewController = segue.destinationViewController as! TrainingViewController
            trainingViewController.training = sender as! Training
        }
    }
    
    // MARK: - UITableView delegate & datasource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let training = (sessionsController.objectAtIndexPath(indexPath) as! TrainingResult).training!
        return FeedCell.cellHeightForTraining(training, tableWidth: CGRectGetWidth(self.tableView.frame))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = sessionsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kFeedCellReuseID, forIndexPath: indexPath) as! FeedCell
        cell.training = (sessionsController.objectAtIndexPath(indexPath) as! TrainingResult).training!
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let training = (sessionsController.objectAtIndexPath(indexPath) as! TrainingResult).training!
        self.performSegueWithIdentifier("ShowTrainingSegue", sender: training)
    }
    
    // MARK - NSFetchedResultsController delegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
}
