//
//  Gym+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 15.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Gym.h"

NS_ASSUME_NONNULL_BEGIN

@interface Gym (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *backendId;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
