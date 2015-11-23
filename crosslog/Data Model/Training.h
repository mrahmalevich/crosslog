//
//  Training.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.10.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Workout;

NS_ASSUME_NONNULL_BEGIN

@interface Training : NSManagedObject

- (NSString *)trainingBody;

@end

NS_ASSUME_NONNULL_END

#import "Training+CoreDataProperties.h"
