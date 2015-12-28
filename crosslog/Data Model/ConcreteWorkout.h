//
//  ConcreteWorkout.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"

@class CompositeWorkout, WorkoutItem;

NS_ASSUME_NONNULL_BEGIN

@interface ConcreteWorkout : Workout

- (NSString *)workoutBody;
- (NSString *)specificParams;

@end

NS_ASSUME_NONNULL_END

#import "ConcreteWorkout+CoreDataProperties.h"
