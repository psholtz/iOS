//
//  DDAnnotationView.h
//  MapDemo
//
//  Created by Engineer on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DDAnnotationView : MKAnnotationView {
@private
	MKMapView *mapView_;
	
	BOOL isMoving_;
	CGPoint startLocation_;
	CGPoint originalCenter_;
	UIImageView *pinShadow_;
	NSTimer *pinTimer_;	
}

+ (id)annotationViewWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier mapView:(MKMapView *)mapView;

@end
