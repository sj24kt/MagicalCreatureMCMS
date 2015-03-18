//
//  MagicalCreature.h
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *descriptionItem;
@property NSString *imageName;
@property NSMutableArray *accessories;

- (instancetype)initWithName:(NSString *)name
                  andDescription:(NSString *)descriptionItem
                    andImageName:(NSString *)imageName
                  andAccessories:(NSMutableArray *)accessories;

@end
