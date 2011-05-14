//
//  MapViewController.m
//  MapDraggableDemo
//
//  Created by Engineer on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "DraggableAnnotation.h"

@implementation MapViewController

static float kLatitudeDelta = 125.0f;
static float kLongitudeDelta = 125.0f;

@synthesize mapView; 

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// get the start coordinate (New York City)
	CLLocationCoordinate2D start;
	start.latitude = 40.7145501673222;
	start.longitude = -74.0071249008179;
	
	// center map 
	MKCoordinateRegion region;
	region.center = start;
	MKCoordinateSpan span;
	span.latitudeDelta = kLatitudeDelta;
	span.longitudeDelta = kLongitudeDelta;
	region.span = span;
	
	[self.mapView setRegion:region animated:YES];
	
	// add the annotation
	DraggableAnnotation	*marker = [[DraggableAnnotation alloc] initWithCoordinate:start];
	marker.title = @"Drag and Drop Pin";
	marker.subtitle = [NSString stringWithFormat:@"%f, %f",start.latitude,start.longitude];
	[self.mapView addAnnotation:marker];

	[marker release];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [super viewDidUnload];
	
	self.mapView = nil; 
	self.mapView.delegate = nil;
}

- (void)dealloc {
	[mapView release];
    [super dealloc];
}


@end
