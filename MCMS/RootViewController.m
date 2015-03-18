//
//  RootViewController.m
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *creatureTableView;
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property NSString *creatureImage;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInitialValues];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.creatureTableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
    cell.textLabel.text = [[self.creatures objectAtIndex:indexPath.row] name];
    cell.detailTextLabel.text = [[self.creatures objectAtIndex:indexPath.row] descriptionItem];

    return cell;
}

#pragma mark - Helper methods

- (void)loadInitialValues {
    MagicalCreature *creatureOne = [[MagicalCreature alloc] initWithName:@"Magical Creature One"
                                                          andDescription:@"Creature One Details"
                                                            andImageName:@"creature-1"
                                                          andAccessories:[NSMutableArray arrayWithObjects:
                                                                          @"accessory 1",
                                                                          @"accessory 2",
                                                                          @"accessory 3", nil]];

    MagicalCreature *creatureTwo = [[MagicalCreature alloc] initWithName:@"Magical Creature Two"
                                                          andDescription:@"Creature Two Details"
                                                            andImageName:@"creature-2"
                                                          andAccessories:[NSMutableArray arrayWithObjects:
                                                                          @"accessory 1",
                                                                          @"accessory 2",
                                                                          @"accessory 3", nil]];

    MagicalCreature *creatureThree = [[MagicalCreature alloc] initWithName:@"Magical Creature Three"
                                                          andDescription:@"Creature Three Details"
                                                            andImageName:@"creature-3"
                                                          andAccessories:[NSMutableArray arrayWithObjects:
                                                                          @"accessory 1",
                                                                          @"accessory 2",
                                                                          @"accessory 3", nil]];

    self.creatures = [NSMutableArray arrayWithObjects:creatureOne,creatureTwo,creatureThree, nil];

//    for (MagicalCreature *creature in self.creatures)
//    {
//        NSLog(@"%@ %@", creature.name, creature.descriptionItem);
//    }
}


#pragma mark - IBActions

// add new creature's name to array
- (IBAction)addButtonOnPressed:(UIButton *)sender {

    // check if there are any empty textFields
    if ([self.creatureNameTextField.text length] > 0 || [self.descriptionTextField.text length] > 0) {
        // add image to initialized creatures
        self.creatureImage = @"";
        if (self.creatures.count <= 3) {
            self.creatureImage = [NSString stringWithFormat:@"creature-%lu", (unsigned long)self.creatures.count];
        }

        MagicalCreature *creature = [[MagicalCreature alloc] initWithName:self.creatureNameTextField.text
                                                            andDescription:self.descriptionTextField.text
                                                              andImageName:self.creatureImage
                                                            andAccessories:[NSMutableArray arrayWithObjects:
                                                                            @"accessory 1",
                                                                            @"accessory 2",
                                                                            @"accessory 3", nil]];
        // add object to array & update table data
        [self.creatures addObject:creature];
        [self.creatureTableView reloadData];

        // empty textFields
        self.creatureNameTextField.text = nil;
        self.descriptionTextField.text = nil;

        // dismiss keyboards
        [self.creatureNameTextField resignFirstResponder];
        [self.descriptionTextField resignFirstResponder];
    }
}

#pragma mark - UISegueViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {

    NSIndexPath *indexPath = [self.creatureTableView indexPathForCell:cell]; // get indexPath on cell
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row]; // create a creature

    CreatureViewController *creatureVC = segue.destinationViewController;
    creatureVC.creature = creature;   // send creature to new DetailVC
    creatureVC.title = creature.name; // send creature name to NavBarTitle
    creatureVC.name = creature.name; // send creature name
    creatureVC.descriptionItem = creature.descriptionItem; //send creature description
}

-(void)unwindCreatureDetailSegue:(UIStoryboardSegue*)sender {

}


@end























