//
//  MapViewController.h
//  MapLines
//
//  Created by Engineer on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController {
	MKMapView *_mapView;
	MKPolyline *_routeLine;
	MKPolylineView *_routeLineView;
	MKMapRect _routeRect;
}

@property (nonatomic,retain) IBOutlet MKMapView *mapView;
@property (nonatomic,retain) MKPolyline *routeLine;
@property (nonatomic,retain) MKPolylineView *routeLineView;

- (void)loadRoute;
- (void)zoomInOnRoute;

@end
