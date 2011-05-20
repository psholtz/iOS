//
//  ControlGroup.m
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ControlGroup.h"
#import "TouchButton.h"

@implementation ControlGroup

@synthesize selected;

- (void)addButton:(TouchButton*)button {
	if ( !buttons ) {
		buttons = [[[NSMutableArray alloc] init] retain];
	}
	[buttons addObject:button];
}

- (void)buttonTapped:(int)position {
	if ( position < 0 ) { return; }
	if ( position >= buttons.count ) { return; }
	
	TouchButton *target = (TouchButton*)[buttons objectAtIndex:position];
	for ( TouchButton* button in buttons ) { 
		if ( button == target ) { 
			[button touchDown];
		} else {
			[button touchUp];
		}
	}
}

- (void)dealloc {
	[buttons release];
	[super dealloc];
}

@end
