//
//  EnterWorkoutResultsDataController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 24.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import MagicalRecord

class EnterResultsDataController {
    
    let training: Training
    private let trainingResult: TrainingResult
    private let localContext: NSManagedObjectContext = NSManagedObjectContext.MR_context()
    private(set) var currentWorkout: Workout?

    // MARK: - Initialization
    init(training: Training) {
        self.training = localContext.objectWithID(training.objectID) as! Training
        self.currentWorkout = self.training.workouts!.firstObject as? Workout
     
        // create training result
        let user = localContext.objectWithID(UserService.sharedInstance.authorizedUser!.objectID) as? User
        let trainingResult = TrainingResult.MR_findFirstWithPredicate(NSPredicate(format: "training = %@ AND user = %@", self.training, user!), inContext: localContext)
        if trainingResult == nil {
            self.trainingResult = TrainingResult.MR_createEntityInContext(localContext)
            self.trainingResult.backendId = NSUUID().UUIDString
            self.trainingResult.training = self.training
            self.trainingResult.user = user
        } else {
            self.trainingResult = trainingResult
        }
    }
    
    // MARK: - Saving data
    func nextWorkout() -> Workout? {
        var nextWorkout: Workout? = nil
        if let workout = currentWorkout {
            let allWorkouts = training.workouts!
            let currentWorkoutIndex = allWorkouts.indexOfObject(workout)
            if currentWorkoutIndex < allWorkouts.count - 1 {
                nextWorkout = allWorkouts[currentWorkoutIndex + 1] as? Workout
            }
        } else {
            nextWorkout = training.workouts!.firstObject as? Workout
        }

        currentWorkout = nextWorkout
        return currentWorkout
    }
    
    func createResultWithTime(time: Int) -> WorkoutResult {
        var workoutResult = WorkoutResult.MR_findFirstWithPredicate(NSPredicate(format: "trainingResult = %@ AND workout = %@", trainingResult, currentWorkout!), inContext: localContext)
        if workoutResult == nil {
            workoutResult = WorkoutResult.MR_createEntityInContext(localContext)
            workoutResult.backendId = NSUUID().UUIDString
            workoutResult.workout = currentWorkout
            workoutResult.trainingResult = trainingResult
        }
        workoutResult.time = time
        return workoutResult
    }
    
    func saveTrainingResultWithCompletion(completion: ErrorClosure?) {
        localContext.MR_saveToPersistentStoreAndWait()
        
        // TODO: send data to backend
    }
}