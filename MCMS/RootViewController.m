//
//  RootViewController.m
//  MCMS
//
//  Created by Sherrie Jones on 3/17/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "RootViewController.h"
#import "MagicalCreature.h"
#import "DetailViewController.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *creatureTableView;
@property (strong, nonatomic) IBOutlet UITextField *creatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *detailTextField;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MagicalCreature *creatureOne = [[MagicalCreature alloc] initWithFullName:@"Tooth Fairy" andWithDetail:@"Pliers"];
    self.creatures = [NSMutableArray arrayWithObjects:creatureOne, nil];

    //    for (MagicalCreature *creature in self.creatures) {
    //        NSLog(@"Creature: %@", creature.name);
    //    }
}
#pragma mark - UITableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];

    cell.textLabel.text = [[self.creatures objectAtIndex:indexPath.row] fullname];
    cell.detailTextLabel.text = creature.detailItem;
    cell.detailTextLabel.text = [[self.creatures objectAtIndex:indexPath.row] detailItem];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

#pragma mark - IBActions

// add new creature's name to array
- (IBAction)addButtonOnPressed:(UIButton *)sender {
    if ([self.creatureTextField.text length] > 0) {
        MagicalCreature *creature = [[MagicalCreature alloc] initWithFullName:self.creatureTextField.text andWithDetail:self.detailTextField.text];
        [self.creatures addObject:creature];
        [self.creatureTableView reloadData];
        
        self.creatureTextField.text = nil;
        self.detailTextField.text = nil;
        [self.creatureTextField resignFirstResponder];
        [self.detailTextField resignFirstResponder];
    }
}

#pragma mark - UISegueViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {

    NSIndexPath *indexPath = [self.creatureTableView indexPathForCell:cell]; // get indexPath on cell
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row]; // create a creature

    DetailViewController *detailVC = segue.destinationViewController;
    detailVC.creature = creature;   // send creature to new DetailVC
    detailVC.title = creature.fullname; // send creature name to new DetailVC
}


@end























