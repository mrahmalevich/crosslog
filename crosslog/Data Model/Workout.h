//
//  Workout.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WorkoutItem;

NS_ASSUME_NONNULL_BEGIN

@interface Workout : NSManagedObject

- (NSString *)workoutBody;

@end

NS_ASSUME_NONNULL_END

#import "Workout+CoreDataProperties.h"
