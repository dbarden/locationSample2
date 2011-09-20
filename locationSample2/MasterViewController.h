//
//  MasterViewController.h
//  locationSample2
//
//  Created by Daniel Barden on 9/20/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) MapViewController *detailViewController;
@property (nonatomic, retain) NSArray *venues;

@end
