//
//  CustomImageView.h
//  MapDemo
//
//  Created by Engineer on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomImageView : MKAnnotationView {
	int index;
}

@property (nonatomic,assign) int index; 

@end
