//
//  DDAnnotation.h
//  MapDemo
//
//  Created by Engineer on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DDAnnotation : MKPlacemark {
	CLLocationCoordinate2D coordinate_;
	NSString *title_;
	NSString *subtitle_;
}

@property (nonatomic, readwrite, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

@end
