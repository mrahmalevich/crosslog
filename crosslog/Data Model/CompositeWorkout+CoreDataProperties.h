//
//  CompositeWorkout+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 28.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CompositeWorkout.h"

NS_ASSUME_NONNULL_BEGIN

@interface CompositeWorkout (CoreDataProperties)

@property (nullable, nonatomic, retain) NSOrderedSet<ConcreteWorkout *> *workouts;

@end

@interface CompositeWorkout (CoreDataGeneratedAccessors)

- (void)insertObject:(ConcreteWorkout *)value inWorkoutsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromWorkoutsAtIndex:(NSUInteger)idx;
- (void)insertWorkouts:(NSArray<ConcreteWorkout *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeWorkoutsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInWorkoutsAtIndex:(NSUInteger)idx withObject:(ConcreteWorkout *)value;
- (void)replaceWorkoutsAtIndexes:(NSIndexSet *)indexes withWorkouts:(NSArray<ConcreteWorkout *> *)values;
- (void)addWorkoutsObject:(ConcreteWorkout *)value;
- (void)removeWorkoutsObject:(ConcreteWorkout *)value;
- (void)addWorkouts:(NSOrderedSet<ConcreteWorkout *> *)values;
- (void)removeWorkouts:(NSOrderedSet<ConcreteWorkout *> *)values;

@end

NS_ASSUME_NONNULL_END
