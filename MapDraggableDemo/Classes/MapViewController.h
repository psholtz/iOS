//
//  MapViewController.h
//  MapDraggableDemo
//
//  Created by Engineer on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController {
	MKMapView *mapView;
}

@property (nonatomic,retain) IBOutlet MKMapView *mapView; 

@end
