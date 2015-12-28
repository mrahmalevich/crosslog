//
//  WorkoutItem.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutItem : NSManagedObject

- (NSString *)itemBody;

@end

NS_ASSUME_NONNULL_END

#import "WorkoutItem+CoreDataProperties.h"
