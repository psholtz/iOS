//
//  MapViewController.m
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AlienMarker.h"
#import "UniversityMarker.h"
#import "Marker.h"
#import "CustomPinView.h"
#import "CustomImageView.h"
#import "MapViewController.h"
#import "MapDemoAppDelegate.h"
#import "DetailViewController.h"
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

static NSArray *PLACES = nil;
static NSArray *MARKERS = nil;

static float kMapDemoLatitudeDelta = 0.035;
static float kMapDemoLongitudeDelta = 0.035;

+ (NSArray*)PLACES	{ return PLACES; }
+ (NSArray*)MARKERS { return MARKERS; }

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

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if ( self ) {
		// custom initialization.
		[self initData];
	}
	return self;
}

- (void)initData {
	// configure the cities 
	if ( PLACES == nil ) { 
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
		[temp addObject:@"Seoul, Korea"];
		[temp addObject:@"Tokyo, Japan"];
		[temp addObject:@"Kona, Hawaii"];
		[temp addObject:@"Area 51, Groom Lake"];
		[temp addObject:@"Secret Nazi UFO Base"];
		PLACES = [[[NSArray alloc] initWithArray:temp] retain];
		[temp release];
	}
	
	// configure the location data
	if ( MARKERS == nil ) { 
		NSMutableArray *temp = [[NSMutableArray	alloc] init];
	
		[temp addObject:[NSNull null]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_SanFrancisco] andSubtitle:@"Founded 1776" andLatitude:37.7791600674391 andLongitude:-122.420049458742 andIndex:kMD_SanFrancisco]];
		[temp addObject:[Marker makeUniversityMarkerWithTitle:[PLACES objectAtIndex:kMD_Stanford] andSubtitle:@"Founded 1891" andLatitude:37.4313700944185 andLongitude:-122.168924957514 andIndex:kMD_Stanford]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_LosAngeles] andSubtitle:@"Founded 1765" andLatitude:34.0534899383783 andLongitude:-118.245319873095 andIndex:kMD_LosAngeles]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_Rio] andSubtitle:@"Founded 1565" andLatitude:-22.9083333 andLongitude:-43.19638889 andIndex:kMD_Rio]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_NewYork] andSubtitle:@"Founded 1664" andLatitude:40.7145501673222 andLongitude:-74.0071249008179 andIndex:kMD_NewYork]];
		[temp addObject:[Marker makeUniversityMarkerWithTitle:[PLACES objectAtIndex:kMD_MIT] andSubtitle:@"Founded 1861" andLatitude:42.359016 andLongitude:-71.093349 andIndex:kMD_MIT]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_Paris] andSubtitle:@"Founded 500 BCE" andLatitude:48.8580666667 andLongitude:2.29444445 andIndex:kMD_Paris]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_Rome] andSubtitle:@"Founded 14,000 BCE" andLatitude:41.9 andLongitude:12.5 andIndex:kMD_Rome]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_Giza] andSubtitle:@"Founded 2,000 BCE" andLatitude:29.97611 andLongitude:31.13278 andIndex:kMD_Giza]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_HongKong] andSubtitle:@"Founded 35,000 BCE" andLatitude:22.25 andLongitude:114.1666667 andIndex:kMD_HongKong]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_Seoul] andSubtitle:@"17 BCE" andLatitude:37.56888889 andLongitude:126.9766667 andIndex:kMD_Seoul]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_Tokyo] andSubtitle:@"Founded 1100s" andLatitude:35.700055556 andLongitude:139.715 andIndex:kMD_Tokyo]];
		[temp addObject:[Marker makeMarkerWithTitle:[PLACES objectAtIndex:kMD_Hawaii] andSubtitle:@"Founded 1795" andLatitude:19.65 andLongitude:-155.994166667 andIndex:kMD_Hawaii]];
		[temp addObject:[Marker makeAlienMarkerWithTitle:[PLACES objectAtIndex:kMD_Area51] andSubtitle:@"Founded 1941" andLatitude:37.646667 andLongitude:-115.745277778 andIndex:kMD_Area51]];
		[temp addObject:[Marker makeAlienMarkerWithTitle:[PLACES objectAtIndex:kMD_SecretBase] andSubtitle:@"Founded 1947" andLatitude:-75.0 andLongitude:0.0 andIndex:kMD_SecretBase]];
	
		MARKERS = [[[NSArray alloc] initWithArray:temp] retain];
		[temp release];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// configure the map
	MKMapView *temp = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.mapContainer.frame.size.width, self.mapContainer.frame.size.height)];
	self.mapView = temp;
	self.mapView.delegate = self;
	self.mapView.showsUserLocation = YES;  // shows current location in pulsating blue ring; 
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
	
	[self.navigationController setNavigationBarHidden:NO animated:YES];
	
	GET_DELEGATE;
	[appDelegate.navController setNavigationBarHidden:YES animated:NO];
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
	return PLACES.count;
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [PLACES objectAtIndex:row];
}

#pragma mark -
#pragma mark PickerView delegate methods
//PickerViewController.m
- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[self focusMap:row];
}

#pragma mark -
#pragma mark Map View Deleate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {	
	if ( [annotation isKindOfClass:[Marker class]] ) {
		Marker *m = (Marker*)annotation;
		
		// HANDLE SPACE ALIEN BASES
		if ( [annotation isKindOfClass:[AlienMarker class]] ) {
			CustomPinView *alienPinView = [[[CustomPinView alloc] initWithAnnotation:annotation reuseIdentifier:@"alien"] autorelease];
			alienPinView.pinColor = MKPinAnnotationColorPurple;
			alienPinView.animatesDrop = YES;
			alienPinView.canShowCallout = YES;	// allows for display of "title/subtitle" and possibly push view 
			alienPinView.index = m.index;
			return alienPinView;
		}
		
		// HANDLE UNIVERSITIES
		else if ( [annotation isKindOfClass:[UniversityMarker class]] ) {
			CustomPinView *universityPinView = [[[CustomPinView alloc] initWithAnnotation:annotation reuseIdentifier:@"university"] autorelease];
			universityPinView.pinColor = MKPinAnnotationColorGreen;
			universityPinView.animatesDrop = YES;
			universityPinView.canShowCallout = YES;
			universityPinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
			universityPinView.index = m.index; 
			return universityPinView;
		}
		
		// HANDLE PARIS
		else if ( m.index == kMD_Paris ) {
			CustomImageView *parisPin = [[[CustomImageView alloc] initWithAnnotation:annotation reuseIdentifier:@"paris"] autorelease];
			parisPin.image = [UIImage imageNamed:@"paris-pin.png"];
			parisPin.backgroundColor = [UIColor clearColor];
			parisPin.canShowCallout = YES;
			parisPin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
			parisPin.index = m.index;
			return parisPin;
		}
		
		// HANDLE GIZA
		else if ( m.index == kMD_Giza ) {
			CustomImageView *gizaPin = [[[CustomImageView alloc] initWithAnnotation:annotation reuseIdentifier:@"giza"] autorelease];
			gizaPin.image = [UIImage imageNamed:@"giza-pin.png"];
			gizaPin.backgroundColor = [UIColor clearColor];
			gizaPin.canShowCallout = YES;
			gizaPin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
			gizaPin.index = m.index;
			return gizaPin;
		}
		
		// HANDLE DEFAULT
		CustomPinView *normalPinView = [[[CustomPinView alloc] initWithAnnotation:annotation reuseIdentifier:@"normal"] autorelease];
		normalPinView.pinColor = MKPinAnnotationColorRed;
		normalPinView.animatesDrop = YES;
		normalPinView.canShowCallout = YES;
		normalPinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		normalPinView.index = m.index;
		return normalPinView;
		
	}
	return nil; 
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	CustomPinView *c = (CustomPinView*)view;

	DetailViewController *detail = [[DetailViewController alloc] initWithIndex:c.index];

	GET_DELEGATE;
	[appDelegate.navController setNavigationBarHidden:NO animated:YES];
	[appDelegate.navController pushViewController:detail animated:YES];
	[detail release];
}

#pragma mark -
#pragma mark Map Methods
- (void)focusMap:(int)position {
	// remove the old annotations;
	if ( CLEAR_ANNOTATIONS ) {
		[self.mapView removeAnnotations:self.mapView.annotations];
	}
	
	// add the new annotation;
	MKCoordinateRegion region;	
	MKCoordinateSpan span;
	span.latitudeDelta = kMapDemoLatitudeDelta;
	span.longitudeDelta = kMapDemoLongitudeDelta;
	region.span = span;
	if ( position > 0 ) {
		Marker *m = [MARKERS objectAtIndex:position];	
		region.center = m.coordinate;		
		[self.mapView setRegion:region animated:TRUE];
		[self.mapView addAnnotation:m];
	}
	else if ( position == 0 ){
		region.center = currentLocation;
		[self.mapView setShowsUserLocation:TRUE];
		[self.mapView setRegion:region animated:TRUE];
	}
}

#pragma mark -
#pragma mark CLLocationManager delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	currentLocation = newLocation.coordinate;
}

@end
