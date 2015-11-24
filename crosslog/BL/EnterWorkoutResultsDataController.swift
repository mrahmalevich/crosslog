//
//  EnterWorkoutResultsDataController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 24.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation
import MagicalRecord

class EnterWorkoutResultsDataController {
    
    let localContext: NSManagedObjectContext = NSManagedObjectContext.MR_context()
    let training: Training
    private(set) var currentWorkout: Workout?

    // MARK: - Initialization
    init(training: Training) {
        self.training = localContext.objectWithID(training.objectID) as! Training
        self.currentWorkout = self.training.workouts!.firstObject as? Workout
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
        let workoutResult = WorkoutResult.MR_createEntityInContext(localContext)
        workoutResult.backendId = NSUUID().UUIDString
        workoutResult.user = localContext.objectWithID(UserService.sharedInstance.authorizedUser!.objectID) as? User
        workoutResult.workout = currentWorkout
        workoutResult.time = time
        return workoutResult
    }
    
    func saveTrainingResultWithCompletion(completion: ErrorClosure?) {
        localContext.MR_saveToPersistentStoreAndWait()
        
        // TODO: send data to backend
    }
}