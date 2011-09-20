//
//  MasterViewController.m
//  locationSample2
//
//  Created by Daniel Barden on 9/20/11.
//  Copyright (c) 2011 None. All rights reserved.
//

#import "MasterViewController.h"

#import "MapViewController.h"
#import "Venue.h"
@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize venues = _venues;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}
							
- (void)dealloc
{
    [_detailViewController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	Venue *venue0 = [[Venue alloc] initWithName:@"Marinha0" withLatitude:-30.05 withLongitude:-51.20];
	venue0.description = @"Este parque esta jogado as tracasasdajsdlkajsdlja asdasasad asdaksjdasd asdlkasjdasd asdlkasdas dasdk asldk asdasldkasdklsad asdkalf asklf dfsdlkfsdlfksd fsdklf sdfklsdfksdlfksdlfsdkfsdlkf sdlfksdlfksdklf sdlfkdsf dsflksdkf dsflsdkf sdlkflsdkflsdkflsdkf sdfklsdflksdflksdlfksdfsdlkf sklfsdfk sdlfsdklfsdkflskd fslkdf sdlkf sldkfklsdfdslfksdlfksdflksdf lskdf sldkflsdkfsdklfksdlfsdlkfsdlk fdslkfsldkflsdkflsdkfsdklf dlskf lsdkfsdlfskdflsdlfksdfsdlkf sdklfdslkfklsd flksd flksdkflsdfkldskfdslfkdslfkdsfldskfsdlfksdlfksdlf sdflk dsf";
	NSArray *photos = [[NSArray alloc] initWithObjects:@"marinha1.jpg", @"marinha2.jpg", @"marinha3.jpg", nil];
	venue0.photos = photos;
	[photos release];

	Venue *venue1 = [[Venue alloc] initWithName:@"Marinha1" withLatitude:-30.05 withLongitude:-51.10];
	venue1.description = @"Este parque esta jogado as tracasasdajsdlkajsdlja asdasasad asdaksjdasd asdlkasjdasd asdlkasdas dasdk asldk asdasldkasdklsad asdkalf asklf dfsdlkfsdlfksd fsdklf sdfklsdfksdlfksdlfsdkfsdlkf sdlfksdlfksdklf sdlfkdsf dsflksdkf dsflsdkf sdlkflsdkflsdkflsdkf sdfklsdflksdflksdlfksdfsdlkf sklfsdfk sdlfsdklfsdkflskd fslkdf sdlkf sldkfklsdfdslfksdlfksdflksdf lskdf sldkflsdkfsdklfksdlfsdlkfsdlk fdslkfsldkflsdkflsdkfsdklf dlskf lsdkfsdlfskdflsdlfksdfsdlkf sdklfdslkfklsd flksd flksdkflsdfkldskfdslfkdslfkdsfldskfsdlfksdlfksdlf sdflk dsf";
	photos = [[NSArray alloc] initWithObjects:@"marinha1.jpg", @"marinha2.jpg", @"marinha3.jpg", nil];
	venue1.photos = photos;
	[photos release];

    Venue *venue2 = [[Venue alloc] initWithName:@"Marinha2" withLatitude:-30.05 withLongitude:-51.00];
	venue2.description = @"Este parque esta jogado as tracasasdajsdlkajsdlja asdasasad asdaksjdasd asdlkasjdasd asdlkasdas dasdk asldk asdasldkasdklsad asdkalf asklf dfsdlkfsdlfksd fsdklf sdfklsdfksdlfksdlfsdkfsdlkf sdlfksdlfksdklf sdlfkdsf dsflksdkf dsflsdkf sdlkflsdkflsdkflsdkf sdfklsdflksdflksdlfksdfsdlkf sklfsdfk sdlfsdklfsdkflskd fslkdf sdlkf sldkfklsdfdslfksdlfksdflksdf lskdf sldkflsdkfsdklfksdlfsdlkfsdlk fdslkfsldkflsdkflsdkfsdklf dlskf lsdkfsdlfskdflsdlfksdfsdlkf sdklfdslkfklsd flksd flksdkflsdfkldskfdslfkdslfkdsfldskfsdlfksdlfksdlf sdflk dsf";
	photos = [[NSArray alloc] initWithObjects:@"marinha1.jpg", @"marinha2.jpg", @"marinha3.jpg", nil];
	venue2.photos = photos;
	[photos release];
    
	NSArray *tmpVenues = [[NSArray alloc] initWithObjects:venue0, venue1, venue2, venue2, nil];
    self.venues = tmpVenues;
    [tmpVenues release];
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

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    // Configure the cell.
    cell.textLabel.text = NSLocalizedString(@"Maps", @"Maps");
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController) {
        self.detailViewController = [[[MapViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    }
    self.detailViewController.venues = _venues;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
