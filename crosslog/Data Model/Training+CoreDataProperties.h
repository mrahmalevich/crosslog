//
//  Training+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 26.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Training.h"

NS_ASSUME_NONNULL_BEGIN

@class Workout, TrainingResult;
@interface Training (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSSet<TrainingResult *> *results;
@property (nullable, nonatomic, retain) NSOrderedSet<Workout *> *workouts;

@end

@interface Training (CoreDataGeneratedAccessors)

- (void)addResultsObject:(TrainingResult *)value;
- (void)removeResultsObject:(TrainingResult *)value;
- (void)addResults:(NSSet<TrainingResult *> *)values;
- (void)removeResults:(NSSet<TrainingResult *> *)values;

- (void)insertObject:(Workout *)value inWorkoutsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromWorkoutsAtIndex:(NSUInteger)idx;
- (void)insertWorkouts:(NSArray<Workout *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeWorkoutsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInWorkoutsAtIndex:(NSUInteger)idx withObject:(Workout *)value;
- (void)replaceWorkoutsAtIndexes:(NSIndexSet *)indexes withWorkouts:(NSArray<Workout *> *)values;
- (void)addWorkoutsObject:(Workout *)value;
- (void)removeWorkoutsObject:(Workout *)value;
- (void)addWorkouts:(NSOrderedSet<Workout *> *)values;
- (void)removeWorkouts:(NSOrderedSet<Workout *> *)values;

@end

NS_ASSUME_NONNULL_END
