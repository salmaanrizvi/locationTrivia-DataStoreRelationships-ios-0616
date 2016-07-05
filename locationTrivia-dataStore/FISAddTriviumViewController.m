//
//  FISAddTriviumViewController.m
//  locationTrivia-dataStore
//
//  Created by Salmaan Rizvi on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviumViewController.h"
#import "FISLocationsDataStore.h"

@interface FISAddTriviumViewController ()

@property (strong, nonatomic) IBOutlet UITextField *locationTriviumTextField;
@property (strong, nonatomic) FISLocationsDataStore *store;
@property (strong, nonatomic) FISLocation *locationToAddTrivium;

@end

@implementation FISAddTriviumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    NSLog(@"Index Location of Trivia Passed Through: %lu", self.indexOfLocationWithTriviaInDataStore);
    self.locationToAddTrivium = self.store.locations[self.indexOfLocationWithTriviaInDataStore];
    NSLog(@"Location to Add Trivium: %@", self.locationToAddTrivium.name);
    // Do any additional setup after loading the view.
}

- (IBAction)saveButtonTapped:(id)sender {
    if ([self.locationTriviumTextField.text isEqualToString:@""]) {
        NSLog(@"Invalid trivium.");
    }
    else {
        FISTrivium *trivium = [[FISTrivium alloc] initWithContent:self.locationTriviumTextField.text likes:0];
        
        NSLog(@"Adding trivium: %@", trivium.content);
        NSLog(@"Current location's array of trivia: %@", ((FISLocation *)self.store.locations[self.indexOfLocationWithTriviaInDataStore]).trivia);
        
        [((FISLocation *)self.store.locations[self.indexOfLocationWithTriviaInDataStore]).trivia addObject:trivium];
        
        NSLog(@"Current location's UPDATED array of trivia: %@", ((FISLocation *)self.store.locations[self.indexOfLocationWithTriviaInDataStore]).trivia);
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
