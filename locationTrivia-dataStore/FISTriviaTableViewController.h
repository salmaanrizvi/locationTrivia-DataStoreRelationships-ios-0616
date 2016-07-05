//
//  FISTriviaTableViewController.h
//  locationTrivia-dataStore
//
//  Created by Salmaan Rizvi on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocationsDataStore.h"
#import "FISLocation.h"
#import "FISAddTriviumViewController.h"

@interface FISTriviaTableViewController : UITableViewController

@property (nonatomic) NSUInteger indexOfLocationInDataStore;

@end
