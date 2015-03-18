//
//  MagicalCreature.h
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *fullname;
@property NSString *detailItem;

- (instancetype)initWithFullName:(NSString *)name andWithDetail:(NSString *)detailItem;

@end
