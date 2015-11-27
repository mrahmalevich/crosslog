//
//  User+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 26.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@class Gym, TrainingResult;
@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *photoUrl;
@property (nullable, nonatomic, retain) NSSet<TrainingResult *> *results;
@property (nullable, nonatomic, retain) Gym *gym;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addResultsObject:(TrainingResult *)value;
- (void)removeResultsObject:(TrainingResult *)value;
- (void)addResults:(NSSet<TrainingResult *> *)values;
- (void)removeResults:(NSSet<TrainingResult *> *)values;

@end

NS_ASSUME_NONNULL_END
