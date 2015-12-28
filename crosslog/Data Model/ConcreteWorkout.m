//
//  ConcreteWorkout.m
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import "ConcreteWorkout.h"
#import "CompositeWorkout.h"
#import "WorkoutItem.h"

@implementation ConcreteWorkout

- (NSString *)workoutBody
{
    NSMutableString *resultString = [NSMutableString new];
    
    // title
    if (self.title.length > 0) {
        [resultString appendString:self.title];
    } else {
        if (self.training.workouts.count > 1) {
            NSInteger index = [self.training.workouts indexOfObject:self];
            [resultString appendFormat:@"WOD %@", @(index + 1)];
        } else {
            [resultString appendString:@"WOD"];
        }
    }
    
    // specific params
    NSString *specificParams = [self specificParams];
    if (specificParams.length > 0) {
        [resultString appendFormat:@"\n%@", specificParams];
    }
    
    // items
    for (WorkoutItem *item in self.items) {
        NSString *itemBody = [item itemBody];
        [resultString appendFormat:@"\n%@", itemBody];
    }
    
    // comment
    if (self.comment.length > 0) {
        [resultString appendFormat:@"\n%@", self.comment];
    }
    
    return [NSString stringWithString:resultString];
}

- (NSString *)specificParams
{
    // override in subclasses
    return nil;
}

@end
