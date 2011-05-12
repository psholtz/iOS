//
//  MapViewController.m
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Marker.h"
#import "MapViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MapViewController(Private)

- (void)initData; 

@end

@implementation MapViewController

@synthesize mapContainer;
@synthesize mapView;
@synthesize pickerView;

@synthesize places;
@synthesize markers; 

static float kMapDemoLatitudeDelta = 0.01;
static float kMapDemoLongitudeDelta = 0.01;

#pragma mark -
#pragma mark Object lifecycle management 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		[self initData];
    }
    return self;
}

- (void)initData {
	// configure the cities 
	NSMutableArray *temp = [[NSMutableArray alloc] init];
	[temp addObject:@"Current Location"];
	[temp addObject:@"San Francisco"];
	[temp addObject:@"Stanford University"];
	[temp addObject:@"Los Angeles"];
	[temp addObject:@"Rio de Janeiro"];
	[temp addObject:@"New York City"];
	[temp addObject:@"M.I.T., Cambridge"];
	[temp addObject:@"Paris, France"];
	[temp addObject:@"Rome, Italy"];
	[temp addObject:@"Giza Pyramids"];
	[temp addObject:@"Hong Kong"];
	[temp addObject:@"Seoul, South Korea"];
	[temp addObject:@"Tokyo, Japan"];
	[temp addObject:@"Hawaii"];
	[temp addObject:@"Secret Nazi UFO Base"];
	self.places = temp;
	
	// configure the location data
	temp = [[NSMutableArray alloc] init];
	
	Marker *m = [[Marker alloc] init];
	m.title = @"New York";
	m.subtitle = @"Founded: xxxx";
	//[temp addObject:m];
	[m release];
	
	self.markers = temp;
	[temp release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// configure the map
	MKMapView *temp = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.mapContainer.frame.size.width, self.mapContainer.frame.size.height)];
	self.mapView = temp;
	self.mapView.delegate = self;
	[self.mapContainer insertSubview:self.mapView atIndex:0];
	[temp release];
	
	// style the view
	[self.mapContainer.layer setCornerRadius:8.0f];
	[self.mapContainer.layer setMasksToBounds:TRUE];
	[self.mapContainer.layer setBorderWidth:2.0f];
	[self.mapContainer.layer setBorderColor:[UIColor blackColor].CGColor];
	
	// configure the location manager
	locationManager = [[[CLLocationManager alloc] init] retain];
	locationManager.delegate = self;
	locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
	[locationManager startUpdatingLocation];
}


- (void)viewDidUnload {
    [super viewDidUnload];

	self.mapContainer = nil; 
	self.pickerView = nil;
	self.mapView = nil;
}

- (void)dealloc {
	// release data
	[markers release];
	[places release];
	
	// release ui components
	[pickerView release];
	[mapView release];
	[mapContainer release];
	
    [super dealloc];
}

#pragma mark -
#pragma mark PickerView data source methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
	return self.places.count;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [self.places objectAtIndex:row];
}

#pragma mark -
#pragma mark PickerView delegate methods
//PickerViewController.m
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[self focusMap:row];
}

#pragma mark -
#pragma mark Map Methods
- (void)focusMap:(int)position {
	MKCoordinateRegion region;	
	MKCoordinateSpan span;
	span.latitudeDelta = kMapDemoLatitudeDelta;
	span.longitudeDelta = kMapDemoLongitudeDelta;
	region.span = span;
	
	switch (position) {
		case kMapDemoCurrentLocation:
			break;
		case kMapDemoSanFrancisco:
			break;
		case kMapDemoStanford:
			break;
		case kMapDemoLosAngeles:
			break;
		case kMapDemoRio:
			break;
		case kMapDemoNewYork:
			break;
		case kMapDemoMIT:
			break;
		case kMapDemoParis:
			break;
		case kMapDemoRome:
			break;
		case kMapDemoGiza:
			break;
		case kMapDemoHongKong:
			break;
		case kMapDemoSeoul:
			break;
		case kMapDemoTokyo:
			break;
		case kMapDemoHawaii:
			break;	
		case kMapDemoSecretBase:
			break;
	}
}

@end
