//
//  TrainingResultsDataController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 25.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

// Fetch training results data from backend
// Provide data to TrainingResultsViewControler

class TrainingResultsDataController {

    let training: Training
    let localContext: NSManagedObjectContext = NSManagedObjectContext.MR_context()
    
    init(training: Training) {
        self.training = training
    }
    
    func updateTrainigResultsWithCompletion(completion: ErrorClosure?) {
        // TODO: Fetch data from backend
    
        if let completion = completion {
            completion(error: nil)
        }
    }

}