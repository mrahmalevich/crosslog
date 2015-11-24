//
//  User+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 24.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@class WorkoutResult;
@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSSet<WorkoutResult *> *results;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addResultsObject:(WorkoutResult *)value;
- (void)removeResultsObject:(WorkoutResult *)value;
- (void)addResults:(NSSet<WorkoutResult *> *)values;
- (void)removeResults:(NSSet<WorkoutResult *> *)values;

@end

NS_ASSUME_NONNULL_END
