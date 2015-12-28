//
//  ConcreteWorkout+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ConcreteWorkout.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteWorkout (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<WorkoutItem *> *items;
@property (nullable, nonatomic, retain) CompositeWorkout *parentWorkout;

@end

@interface ConcreteWorkout (CoreDataGeneratedAccessors)

- (void)addItemsObject:(WorkoutItem *)value;
- (void)removeItemsObject:(WorkoutItem *)value;
- (void)addItems:(NSSet<WorkoutItem *> *)values;
- (void)removeItems:(NSSet<WorkoutItem *> *)values;

@end

NS_ASSUME_NONNULL_END
