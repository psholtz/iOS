//
//  MapViewController.h
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <CoreLocation/CoreLocation.h>

enum {	kMapDemoCurrentLocation, kMapDemoSanFrancisco, kMapDemoStanford, kMapDemoLosAngeles, kMapDemoRio, kMapDemoNewYork,
		kMapDemoMIT, kMapDemoParis, kMapDemoRome, kMapDemoGiza, kMapDemoHongKong, kMapDemoSeoul, kMapDemoTokyo, kMapDemoHawaii, kMapDemoSecretBase };

@interface MapViewController : UIViewController <MKMapViewDelegate,UIPickerViewDataSource,CLLocationManagerDelegate> {
	// interface components
	UIView *mapContainer; 
	UIPickerView *pickerView; 
	MKMapView *mapView; 
	
	// data components
	NSArray *places;
	NSArray *markers;
	CLLocationManager *locationManager;
}

@property (nonatomic,retain) IBOutlet UIView *mapContainer;
@property (nonatomic,retain) IBOutlet UIPickerView *pickerView;
@property (nonatomic,retain) MKMapView *mapView; 

@property (nonatomic,retain) NSArray *places;
@property (nonatomic,retain) NSArray *markers;

- (void)focusMap:(int)position; 

@end
