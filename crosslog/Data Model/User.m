//
//  User.m
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)fullName {
    NSMutableString *resultString = [NSMutableString new];
    if (self.firstName) {
        [resultString appendString:self.firstName];
    }
    if (self.lastName) {
        if (self.firstName) {
            [resultString appendString:@" "];
        }
        [resultString appendString:self.lastName];
    }
    return [NSString stringWithString:resultString];
}

@end
