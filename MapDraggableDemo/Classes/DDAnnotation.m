//
//  DDAnnotation.m
//  MapDemo
//
//  Created by Engineer on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DDAnnotation.h"


@implementation DDAnnotation

@synthesize coordinate = coordinate_;
@synthesize title = title_;
@synthesize subtitle = subtitle_;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate addressDictionary:(NSDictionary *)addressDictionary {
	self = [super initWithCoordinate:coordinate addressDictionary:addressDictionary];
	if ( self ) {
		self.coordinate = coordinate;
	}
	return self;
}

- (void)dealloc {
	[title_ release];
	[subtitle_ release];
	
	[super dealloc];
}

@end
