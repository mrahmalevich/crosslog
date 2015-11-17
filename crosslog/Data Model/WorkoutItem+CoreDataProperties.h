//
//  WorkoutItem+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WorkoutItem.h"

NS_ASSUME_NONNULL_BEGIN

@class Exercise, Workout;
@interface WorkoutItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSNumber *count;
@property (nullable, nonatomic, retain) NSNumber *extraWeight;
@property (nullable, nonatomic, retain) NSNumber *minCount;
@property (nullable, nonatomic, retain) NSNumber *units;
@property (nullable, nonatomic, retain) NSNumber *weight;
@property (nullable, nonatomic, retain) Exercise *exercise;
@property (nullable, nonatomic, retain) Workout *workout;

@end

NS_ASSUME_NONNULL_END
