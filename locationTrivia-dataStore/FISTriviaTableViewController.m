//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Salmaan Rizvi on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"

@interface FISTriviaTableViewController ()

@property (strong, nonatomic) FISLocationsDataStore *store;
@property (strong, nonatomic) FISLocation *currentLocation;

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.accessibilityLabel = @"Trivia Table";
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated {
    self.currentLocation = ((FISLocation *)self.store.locations[self.indexOfLocationInDataStore]);
    
    for (FISTrivium *trivium in self.currentLocation.trivia) {
        NSLog(@"%@", trivium.content);
    }
    
    NSLog(@"Reloading Trivia Data for Location");
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((FISLocation *)self.store.locations[self.indexOfLocationInDataStore]).trivia.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"triviaCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = ((FISTrivium *)((FISLocation *)self.store.locations[self.indexOfLocationInDataStore]).trivia[indexPath.row]).content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", ((FISTrivium *)((FISLocation *)self.store.locations[self.indexOfLocationInDataStore]).trivia[indexPath.row]).likes];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"addTrivium"]) {
        FISAddTriviumViewController *addTriviumVC = segue.destinationViewController;
        NSLog(@"FISTriviaTableVC Index for Selected Row: %lu", self.indexOfLocationInDataStore);
        addTriviumVC.indexOfLocationWithTriviaInDataStore = self.indexOfLocationInDataStore;
    }
    
}


@end
