//
//  Exercise+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Exercise.h"

NS_ASSUME_NONNULL_BEGIN

@interface Exercise (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *abbr;
@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *optionalWeighted;
@property (nullable, nonatomic, retain) NSNumber *type;
@property (nullable, nonatomic, retain) NSNumber *units;
@property (nullable, nonatomic, retain) NSNumber *weighted;
@property (nullable, nonatomic, retain) NSSet<WorkoutItem *> *items;

@end

@interface Exercise (CoreDataGeneratedAccessors)

- (void)addItemsObject:(WorkoutItem *)value;
- (void)removeItemsObject:(WorkoutItem *)value;
- (void)addItems:(NSSet<WorkoutItem *> *)values;
- (void)removeItems:(NSSet<WorkoutItem *> *)values;

@end

NS_ASSUME_NONNULL_END
