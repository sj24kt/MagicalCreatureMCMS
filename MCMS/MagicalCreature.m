//
//  MagicalCreature.m
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

- (instancetype)initWithFullName:(NSString *)name andWithDetail:(NSString *)detail{
    self = [super init];

    if (self) {
        self.fullname = name;
        self.detailItem = detail;
    }

    return self;
}

@end




















