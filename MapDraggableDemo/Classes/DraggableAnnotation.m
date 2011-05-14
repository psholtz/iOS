//
//  DraggableAnnotation.m
//  MapDraggableDemo
//
//  Created by Engineer on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DraggableAnnotation.h"


@implementation DraggableAnnotation 

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coord {
	self = [super init];
	if ( self ) { 
		coordinate = coord;
	}
	return self;
}

- (void)dealloc {
	[title release];
	[subtitle release];
	[super dealloc];
}

@end
