//
//  Training.m
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 26.11.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import "Training.h"
#import "TrainingResult.h"
#import "Workout.h"
#import "WorkoutItem.h"
#import "Exercise.h"

#import "crosslog-swift.h"

@implementation Training

- (NSString *)trainingBody {
    NSMutableString *resultString = [NSMutableString new];
    for (NSInteger i = 0; i < self.workouts.count; i++) {
        Workout *workout = self.workouts[i];
        
        // title
        if (workout.title.length > 0) {
            [resultString appendString:workout.title];
        } else {
            [resultString appendFormat:@"WOD %@", self.workouts.count > 1 ? @(i + 1) : @""];
        }
        
        // items
        for (WorkoutItem *item in workout.items) {
            NSMutableString *itemString = [NSMutableString new];
            Exercise *exercise = item.exercise;
            
            // # abbr
            [itemString appendString:exercise.abbr];
            // # weight
            if (exercise.weighted.boolValue) {
                [itemString appendFormat:@" %@ %@", item.weight, [FormattingService weightUnitsString]];
            }
            // # count
            NSString *minCountString = item.minCount ? [NSString stringWithFormat:@"%@-", item.minCount] : @"";
            [itemString appendFormat:@" %@%@ %@", minCountString, item.count, [FormattingService exerciseUnitsStringForUnits:[item.units integerValue]]];
            
            [resultString appendFormat:@"\n%@", itemString];
        }
        
        // comment
        if (workout.comment.length > 0) {
            [resultString appendFormat:@"\n%@", workout.comment];
        }
        
        if (![workout isEqual:self.workouts.lastObject]) {
            [resultString appendString:@"\n\n"];
        }
    }
    return [NSString stringWithString:resultString];
}
@end
