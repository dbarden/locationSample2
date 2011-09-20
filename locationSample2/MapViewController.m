//
//  DetailViewController.m
//  locationSample2
//
//  Created by Daniel Barden on 9/20/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "MapViewController.h"
#import "DetailViewController.h"
#import "Venue.h"

@interface MyAnnotation : NSObject <MKAnnotation> 
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) Venue *venue;
@end

@implementation MyAnnotation
@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize venue = _venue;

@end

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize venues = _venues;
@synthesize map = _map;
- (void)dealloc
{
	_map.delegate = nil;
	[_map release];
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    MKMapView *map = [[MKMapView alloc] initWithFrame:self.view.frame];

    NSMutableArray *annots = [[NSMutableArray alloc] init];
    for (Venue *venue in _venues) {
        MyAnnotation *annot = [[MyAnnotation alloc] init];
        annot.coordinate = venue.location.coordinate;
		annot.title = venue.name;
		annot.venue = venue;
        [annots addObject:annot];
        [annot release];
    }
    
    MKCoordinateRegion region;
	Venue *venue = [_venues objectAtIndex:1];
	region.center.latitude = venue.location.coordinate.latitude;
	region.center.longitude = venue.location.coordinate.longitude;
	region.span.latitudeDelta = 0.2;
	region.span.longitudeDelta = 0.2;

	[map setRegion:region];
	map.delegate = self;
	
	[map addAnnotations:annots];
	self.map = map;
    [self.view addSubview:_map];
	[map release];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	static NSString *identifier = @"AnnotView";
	MKPinAnnotationView *annot = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
	
	if (annot == nil) {
		annot = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
	}
	annot.annotation = annotation;
	annot.canShowCallout = YES;
	UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	annot.rightCalloutAccessoryView  = button;
	return annot;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	MyAnnotation *annot = view.annotation;
	Venue *venue = annot.venue;
	DetailViewController *detail = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
	detail.venue = venue;
	
	[self.navigationController pushViewController:detail animated:YES];
	[detail release];
}
@end
