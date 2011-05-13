//
//  CustomPinView.h
//  MapDemo
//
//  Created by Engineer on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomPinView : MKPinAnnotationView {
	int index;
}

@property (nonatomic,assign) int index;

@end
