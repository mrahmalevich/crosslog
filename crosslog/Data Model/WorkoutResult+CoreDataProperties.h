//
//  WorkoutResult+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 26.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WorkoutResult.h"

NS_ASSUME_NONNULL_BEGIN

@class TrainingResult, Workout;
@interface WorkoutResult (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSNumber *reps;
@property (nullable, nonatomic, retain) NSNumber *time;
@property (nullable, nonatomic, retain) Workout *workout;
@property (nullable, nonatomic, retain) TrainingResult *trainingResult;

@end

NS_ASSUME_NONNULL_END
