//
//  TrainingResult+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 26.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TrainingResult.h"

NS_ASSUME_NONNULL_BEGIN

@class Training, WorkoutResult;
@interface TrainingResult (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) Training *training;
@property (nullable, nonatomic, retain) User *user;
@property (nullable, nonatomic, retain) NSSet<WorkoutResult *> *workoutResults;

@end

@interface TrainingResult (CoreDataGeneratedAccessors)

- (void)addWorkoutResultsObject:(WorkoutResult *)value;
- (void)removeWorkoutResultsObject:(WorkoutResult *)value;
- (void)addWorkoutResults:(NSSet<WorkoutResult *> *)values;
- (void)removeWorkoutResults:(NSSet<WorkoutResult *> *)values;

@end

NS_ASSUME_NONNULL_END
