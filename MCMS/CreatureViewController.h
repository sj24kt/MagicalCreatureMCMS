//
//  CreatureViewController.h
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MagicalCreature.h"

@interface CreatureViewController : UIViewController

@property MagicalCreature *creature;
@property NSIndexPath *indexPath;
@property NSMutableArray *creatures;
@property NSString *name;
@property NSString *descriptionItem;

@end
