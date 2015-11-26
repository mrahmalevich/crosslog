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

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *results;

@end

@interface User (CoreDataGeneratedAccessors)

- (void)addResultsObject:(NSManagedObject *)value;
- (void)removeResultsObject:(NSManagedObject *)value;
- (void)addResults:(NSSet<NSManagedObject *> *)values;
- (void)removeResults:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
