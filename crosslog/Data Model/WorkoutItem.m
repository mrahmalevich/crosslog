//
//  WorkoutItem.m
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 23.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import "WorkoutItem.h"

#import "crosslog-swift.h"

@implementation WorkoutItem

- (NSString *)itemBody
{
    NSMutableString *itemString = [NSMutableString new];
    
    // abbr
    [itemString appendString:self.exercise.abbr];
    // weight
    if (self.exercise.weighted.boolValue) {
        [itemString appendFormat:@" %@ %@", self.weight, [FormattingService weightUnitsString]];
    }
    // count
    NSString *minCountString = self.minCount ? [NSString stringWithFormat:@"%@-", self.minCount] : @"";
    [itemString appendFormat:@" %@%@ %@", minCountString, self.count, [FormattingService exerciseUnitsStringForUnits:[self.units integerValue]]];
    // comment
    if (self.comment.length > 0) {
        [itemString appendFormat:@"\n%@", self.comment];
    }
    
    return [NSString stringWithString:itemString];
}

@end
