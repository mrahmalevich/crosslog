//
//  WorkoutConstructorDataController.swift
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 28.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

import Foundation

class WorkoutConstructorDataController {
    
    static let sharedInstance = WorkoutConstructorDataController()
    
    let localContext: NSManagedObjectContext = NSManagedObjectContext.MR_context()
    var currentWorkout: Workout?

    // MARK: - Static methods
    static func workoutOfType(type: WorkoutType, context: NSManagedObjectContext) -> Workout {
        let workout: Workout
        switch (type) {
            case .Chipper:
                workout = Chipper.MR_createEntityInContext(context)
            case .RFT:
                workout = RFT.MR_createEntityInContext(context)
            case .AMRAP:
                workout = AMRAP.MR_createEntityInContext(context)
            case .EMOM:
                workout = EMOM.MR_createEntityInContext(context)
            case .TABATA:
                workout = TABATA.MR_createEntityInContext(context)
            case .FGBStyle:
                workout = FGBStyle.MR_createEntityInContext(context)
            case .Composite:
                workout = CompositeWorkout.MR_createEntityInContext(context)
        }
        return workout
    }
    
    // MARK: - Constructor workflow
    func createWorkoutWithType(type: WorkoutType) {
        localContext.rollback()
        currentWorkout = WorkoutConstructorDataController.workoutOfType(type, context: localContext)
    }
}