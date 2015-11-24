//
//  EnterResultViewController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 24.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import SnapKit

class EnterResultViewController: UIViewController, EnterWorkoutResultsViewControllerDelegate {
    @IBOutlet private weak var resultsContainerView: UIView!
    
    var training: Training! = nil {
        didSet {
            self.enterResultsDataController = EnterWorkoutResultsDataController(training: training)
        }
    }
    var enterResultsDataController: EnterWorkoutResultsDataController! = nil
    weak var currentWorkoutViewController: EnterWorkoutResultsViewController? = nil
    
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
        self.setupWorkoutView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - EnterWorkoutResultsViewController delegate
    func workoutResultsControllerDidEnterResults(controller: EnterWorkoutResultsViewController) {
        enterResultsDataController.createResultWithTime(controller.resultTime())
        enterResultsDataController.nextWorkout()
        self.setupWorkoutView()
    }
    
    // MARK: - Utils
    func setupWorkoutView() {
        if let workout = enterResultsDataController.currentWorkout {

            // add new workout view
            let workoutResultsController = EnterWorkoutResultsViewController.init(workout: workout)
            self.addChildViewController(workoutResultsController)
            resultsContainerView.addSubview(workoutResultsController.view)
            workoutResultsController.view.snp_makeConstraints(closure: {(make: ConstraintMaker) in
                make.edges.equalTo(resultsContainerView)
            })
            workoutResultsController.view.layoutIfNeeded()
            workoutResultsController.didMoveToParentViewController(self)
            workoutResultsController.delegate = self
            
            // remove previous
            if (currentWorkoutViewController != nil) {
                currentWorkoutViewController!.willMoveToParentViewController(self)
                currentWorkoutViewController!.view.removeFromSuperview()
                currentWorkoutViewController!.removeFromParentViewController()
            }
            self.currentWorkoutViewController = workoutResultsController

        } else {
            enterResultsDataController.saveTrainingResultWithCompletion(nil)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}