//
//  Workout+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Workout.h"

NS_ASSUME_NONNULL_BEGIN

@class Training;
@interface Workout (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSOrderedSet<WorkoutItem *> *items;
@property (nullable, nonatomic, retain) Training *training;

@end

@interface Workout (CoreDataGeneratedAccessors)

- (void)insertObject:(WorkoutItem *)value inItemsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromItemsAtIndex:(NSUInteger)idx;
- (void)insertItems:(NSArray<WorkoutItem *> *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeItemsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInItemsAtIndex:(NSUInteger)idx withObject:(WorkoutItem *)value;
- (void)replaceItemsAtIndexes:(NSIndexSet *)indexes withItems:(NSArray<WorkoutItem *> *)values;
- (void)addItemsObject:(WorkoutItem *)value;
- (void)removeItemsObject:(WorkoutItem *)value;
- (void)addItems:(NSOrderedSet<WorkoutItem *> *)values;
- (void)removeItems:(NSOrderedSet<WorkoutItem *> *)values;

@end

NS_ASSUME_NONNULL_END
