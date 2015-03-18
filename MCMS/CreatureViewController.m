//
//  CreatureViewController.m
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelCreatureName;
@property (weak, nonatomic) IBOutlet UILabel *labelCreatureDetail;
@property (strong, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCreatureName;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCreatureDetail;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.creature.name;
    self.labelCreatureName.text = self.creature.name;
    self.labelCreatureDetail.text = self.creature.descriptionItem;

    if (![self.creature.imageName isEqualToString:@""]) {
        [self.creatureImageView setImage:[UIImage imageNamed:self.creature.imageName]];
    }

    // hide the textField
    self.textFieldCreatureName.hidden = true;
    self.textFieldCreatureDetail.hidden = true;

}

#pragma mark -UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creature.accessories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"AccessoryCell"];
    cell.textLabel.text = [self.creature.accessories objectAtIndex:indexPath.row];
    return cell;

}

#pragma mark - IBActions

- (IBAction)editButtonOnPressed:(UIButton *)button {


}


@end




























