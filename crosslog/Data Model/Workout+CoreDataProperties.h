//
//  Workout+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Workout.h"

NS_ASSUME_NONNULL_BEGIN

@interface Workout (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSSet<WorkoutResult *> *results;
@property (nullable, nonatomic, retain) Training *training;

@end

@interface Workout (CoreDataGeneratedAccessors)

- (void)addResultsObject:(WorkoutResult *)value;
- (void)removeResultsObject:(WorkoutResult *)value;
- (void)addResults:(NSSet<WorkoutResult *> *)values;
- (void)removeResults:(NSSet<WorkoutResult *> *)values;

@end

NS_ASSUME_NONNULL_END
