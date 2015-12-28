//
//  CompositeWorkout.m
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import "CompositeWorkout.h"

@implementation CompositeWorkout

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

    // subworkouts
    for (ConcreteWorkout *workout in self.workouts) {
        NSString *workoutBody = [workout workoutBody];
        [resultString appendFormat:@"\n%@", workoutBody];
    }
    
    // comment
    if (self.comment.length > 0) {
        [resultString appendFormat:@"\n%@", self.comment];
    }
    
    return [NSString stringWithString:resultString];
}

@end
