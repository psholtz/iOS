//
//  MapViewController.m
//  MapLines
//
//  Created by Engineer on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize routeLine = _routeLine;
@synthesize routeLineView = _routeLineView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self loadRoute];
	if ( self.routeLine != nil ) {
		[self.mapView addOverlay:self.routeLine];
	}
	
	[self zoomInOnRoute];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	self.mapView = nil;
	self.mapView.delegate = nil;
}

- (void)dealloc {
	[_routeLineView release];
	[_routeLine release];
	[_mapView release];
    [super dealloc];
}


#pragma mark -
#pragma mark Custom APIs
- (void)loadRoute {
	NSString* filePath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"csv"];
	NSString* fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSArray* pointStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	
	// while we create the route points, we will also be calculating the bounding box of our route
	// so we can easily zoom in on it. 
	MKMapPoint northEastPoint; 
	MKMapPoint southWestPoint; 
	
	// create a c array of points. 
	MKMapPoint* pointArr = malloc(sizeof(CLLocationCoordinate2D) * pointStrings.count);
	
	for(int idx = 0; idx < pointStrings.count; idx++)
	{
		// break the string down even further to latitude and longitude fields. 
		NSString* currentPointString = [pointStrings objectAtIndex:idx];
		NSArray* latLonArr = [currentPointString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
		
		CLLocationDegrees latitude  = [[latLonArr objectAtIndex:0] doubleValue];
		CLLocationDegrees longitude = [[latLonArr objectAtIndex:1] doubleValue];
		
		// create our coordinate and add it to the correct spot in the array 
		CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
		
		MKMapPoint point = MKMapPointForCoordinate(coordinate);
		
		//
		// adjust the bounding box
		//
		
		// if it is the first point, just use them, since we have nothing to compare to yet. 
		if (idx == 0) {
			northEastPoint = point;
			southWestPoint = point;
		}
		else 
		{
			if (point.x > northEastPoint.x) 
				northEastPoint.x = point.x;
			if(point.y > northEastPoint.y)
				northEastPoint.y = point.y;
			if (point.x < southWestPoint.x) 
				southWestPoint.x = point.x;
			if (point.y < southWestPoint.y) 
				southWestPoint.y = point.y;
		}
		
		pointArr[idx] = point;
	}
	
	// create the polyline based on the array of points. 
	self.routeLine = [MKPolyline polylineWithPoints:pointArr count:pointStrings.count];
	
	_routeRect = MKMapRectMake(southWestPoint.x, southWestPoint.y, northEastPoint.x - southWestPoint.x, northEastPoint.y - southWestPoint.y);
	
	// clear the memory allocated earlier for the points
	free(pointArr);
}

- (void)zoomInOnRoute {
	[self.mapView setVisibleMapRect:_routeRect];
}

#pragma mark MKMapViewDelegate
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
	MKOverlayView* overlayView = nil;
	if ( overlay == self.routeLine ) {
		if ( self.routeLineView == nil ) {
			self.routeLineView = [[[MKPolylineView alloc] initWithPolyline:self.routeLine] autorelease];
			self.routeLineView.fillColor = [UIColor purpleColor];
			self.routeLineView.strokeColor = [UIColor purpleColor];
			self.routeLineView.lineWidth = 3;
		}
		overlayView = self.routeLineView;
	}
	return overlayView;
}

@end
