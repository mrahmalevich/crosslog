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

    // title
    NSString *dateString = [[FormattingService dateFormatterWithFormat:@"yyyy-MM-dd"] stringFromDate:self.date];
    [resultString appendString:dateString];
    [resultString appendString:@"\n"];
    
    for (Workout *workout in self.workouts) {
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
