//
//  PinMark.m
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Marker.h"



@implementation Marker

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c {
	coordinate=c;
	return self;
}

- (void)dealloc {
	[title release];
	[subtitle release];
	[super dealloc];
}

@end
