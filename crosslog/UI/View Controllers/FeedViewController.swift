//
//  FeedViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 22.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import UIKit

let kFeedCellReuseID: String = "kFeedCell"

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, FeedCellDelegate {
    @IBOutlet private weak var tableView: UITableView!

    private var initialized = false
    private let feedDataController: FeedDataController
    private let sessionsController: NSFetchedResultsController
    
    // MARK: - Initialization
    required convenience init(coder aDecoder: NSCoder) {
        self.init(aDecoder)
    }
    
    init(_ coder: NSCoder? = nil) {
        self.feedDataController = FeedDataController();
        self.sessionsController = Training.MR_fetchAllSortedBy("date", ascending: false, withPredicate: nil, groupBy: nil, delegate: nil)
        
        if let coder = coder {
            super.init(coder: coder)!
        }
        else {
            super.init(nibName: nil, bundle:nil)
        }
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SharedDataManager.sharedInstance.updateExercisesWithCompletion(nil)
        feedDataController.updateSessionsWithCompletion(nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "ShowTrainingSegue") {
            let trainingViewController = segue.destinationViewController as! TrainingViewController
            trainingViewController.training = sender as! Training
        }
    }
    
    // MARK: - Feed cell delegate
    func didPressResultsButtonForFeedCell(cell: FeedCell) {
        self.performSegueWithIdentifier("ShowResultsSegue", sender: nil)
    }

    func didPressEnterResultButtonForFeedCell(cell: FeedCell) {
        self.performSegueWithIdentifier("EnterResultsSegue", sender: nil)
    }
    
    // MARK: - UITableView delegate & datasource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let training = sessionsController.objectAtIndexPath(indexPath) as! Training
        return FeedCell.cellHeightForTraining(training, tableWidth: CGRectGetWidth(self.tableView.frame))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = sessionsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kFeedCellReuseID, forIndexPath: indexPath) as! FeedCell
        cell.training = sessionsController.objectAtIndexPath(indexPath) as! Training
        cell.delegate = self
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let training = sessionsController.objectAtIndexPath(indexPath) as! Training
        self.performSegueWithIdentifier("ShowTrainingSegue", sender: training)
    }
    
    // MARK - NSFetchedResultsController delegate
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
}
