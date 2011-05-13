//
//  PinMark.h
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class AlienMarker;
@class UniversityMarker;

@interface Marker : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *sutitle;
	int index; 
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;
@property (nonatomic, assign) int index; 

+ (Marker*)makeMarkerWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle andLatitude:(float)latitude andLongitude:(float)longitude andIndex:(int)index;
+ (AlienMarker*)makeAlienMarkerWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle andLatitude:(float)latitude andLongitude:(float)longitude andIndex:(int)index;
+ (UniversityMarker*)makeUniversityMarkerWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle andLatitude:(float)latitude andLongitude:(float)longitude andIndex:(int)index;

- (id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end
