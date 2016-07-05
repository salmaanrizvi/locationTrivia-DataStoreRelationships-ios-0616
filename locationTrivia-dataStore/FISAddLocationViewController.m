//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Salmaan Rizvi on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataStore.h"

@interface FISAddLocationViewController ()

@property (nonatomic, strong) FISLocationsDataStore *store;
@property (strong, nonatomic) IBOutlet UITextField *nameTextFIeld;
@property (strong, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (strong, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (strong, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
    // Do any additional setup after loading the view.
}
- (IBAction)cancelButtonTapped:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonTapped:(UIButton *)sender {
    FISLocation *newLocation = [[FISLocation alloc] initWithName:self.nameTextFIeld.text
                                                        latitude:self.latitudeTextField.text.floatValue
                                                       longitude:self.longitudeTextField.text.floatValue];
    
//    if ([self.nameTextFIeld.text isEqualToString:@""] || [self.latitudeTextField.text isEqualToString:@""] || [self.longitudeTextField.text isEqualToString:@""]) {
//        NSLog(@"Invalid location.");
//    }
//    else {
        [self.store.locations addObject:newLocation];
        [self dismissViewControllerAnimated:YES completion:nil];
//    }
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
