//
//  Workout.m
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import "Workout.h"
#import "WorkoutItem.h"

@implementation Workout

- (NSString *)workoutBody
{
    NSParameterAssert(@"Should be overriden");
    return nil;
}

@end
