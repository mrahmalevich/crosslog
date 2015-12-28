//
//  CompositeWorkout.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Workout.h"
#import "ConcreteWorkout.h"

NS_ASSUME_NONNULL_BEGIN

@interface CompositeWorkout : Workout

- (NSString *)workoutBody;

@end

NS_ASSUME_NONNULL_END

#import "CompositeWorkout+CoreDataProperties.h"
