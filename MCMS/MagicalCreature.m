//
//  MagicalCreature.m
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

- (instancetype)initWithName:(NSString *)name
                  andDescription:(NSString *)descriptionItem
                    andImageName:(NSString *)imageName
                  andAccessories:(NSMutableArray *)accessories {
    self = [super init];

    if (self) {
        self.name = name;
        self.descriptionItem = descriptionItem;
        self.imageName = imageName;
        self.accessories = accessories;
    }

    return self;
}

@end




















