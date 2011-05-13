//
//  PinMark.m
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Marker.h"
#import "AlienMarker.h"
#import "UniversityMarker.h"

@implementation Marker

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
@synthesize index;

+ (Marker*)makeMarkerWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle andLatitude:(float)latitude andLongitude:(float)longitude andIndex:(int)index
{
	// build the coordinate
	CLLocation *loc = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
	Marker *m = [[[Marker alloc] initWithCoordinate:loc.coordinate] autorelease];
	[loc release];
	
	// set the additional data
	m.title = title;
	m.subtitle = subtitle;
	m.index = index;
	
	return m;
}

+ (AlienMarker*)makeAlienMarkerWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle andLatitude:(float)latitude andLongitude:(float)longitude andIndex:(int)index
{
	// build the coordinate
	CLLocation *loc = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
	AlienMarker *m = [[[AlienMarker alloc] initWithCoordinate:loc.coordinate] autorelease];
	[loc release];
	
	// set the additional data
	m.title = title;
	m.subtitle = subtitle;
	m.index = index;
	
	return m;
}

+ (UniversityMarker*)makeUniversityMarkerWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle andLatitude:(float)latitude andLongitude:(float)longitude andIndex:(int)index
{
	// build the coordinate
	CLLocation *loc = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
	UniversityMarker *m = [[[UniversityMarker alloc] initWithCoordinate:loc.coordinate] autorelease];
	[loc release];
	
	// set the additional data
	m.title = title;
	m.subtitle = subtitle;
	m.index = index;
	
	return m;
}

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
