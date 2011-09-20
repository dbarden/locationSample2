//
//  DetailViewController.h
//  locationSample2
//
//  Created by Daniel Barden on 9/20/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) NSArray *venues;

@property (nonatomic, retain) MKMapView *map;
@end
