//
//  MapViewController.h
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define CLEAR_ANNOTATIONS 1

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <CoreLocation/CoreLocation.h>

enum {	kMD_CurrentLocation, kMD_SanFrancisco, kMD_Stanford, kMD_LosAngeles, kMD_Rio, kMD_NewYork,
		kMD_MIT, kMD_Paris, kMD_Rome, kMD_Giza, kMD_HongKong, kMD_Seoul, kMD_Tokyo, kMD_Hawaii, 
		kMD_Area51, kMD_SecretBase };

@interface MapViewController : UIViewController <MKMapViewDelegate,UIPickerViewDataSource,CLLocationManagerDelegate> {
	// interface components
	UIView *mapContainer; 
	UIPickerView *pickerView; 
	MKMapView *mapView; 
	
	// data components
	NSArray *places;
	NSArray *markers;
	CLLocationManager *locationManager;
	CLLocationCoordinate2D currentLocation;
}

@property (nonatomic,retain) IBOutlet UIView *mapContainer;
@property (nonatomic,retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic,retain) MKMapView *mapView; 

@property (nonatomic,retain) NSArray *places;
@property (nonatomic,retain) NSArray *markers;

+ (NSArray*)PLACES;
+ (NSArray*)MARKERS;

- (void)focusMap:(int)position; 

@end
