//
//  FGBStyle+CoreDataProperties.h
//  crosslog
//
//  Created by Mikhail Rakhmalevich on 27.12.15.
//  Copyright © 2015 Mikhail Rakhmalevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "FGBStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface FGBStyle (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *rounds;
@property (nullable, nonatomic, retain) NSNumber *stationTime;

@end

NS_ASSUME_NONNULL_END
