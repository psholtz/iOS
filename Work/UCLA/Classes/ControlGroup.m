//
//  ControlGroup.m
//  UCLA
//
//  Created by Buyer on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ControlGroup.h"

@implementation ControlGroup

@synthesize hold = _holdButtons;
@synthesize selected = _selected;
@synthesize slider = _slider;
@synthesize left = _left;
@synthesize right = _right;

- (int) value {
	if ( _selected != -1 ) {
		return ((PushableButton*)[_pushableButtons objectAtIndex:_selected]).value;
	}
	return PUSHABLE_UNINITIALIZED_VALUE;
}

- (id) init:(BOOL)holdButtons
{
	if ( self = [super init] ) { 
		_holdButtons = holdButtons;
		_selected = -1;
	}
	return self;
}

- (void) addPushButton:(PushableButton*)button 
{
	// configure the properties of the button;
	button.delegate = self;
	button.hold = self.hold;
	
	// add the button to our array;
	if ( !_pushableButtons ) { 
		_pushableButtons = [[NSMutableArray alloc] init];
	}
	[_pushableButtons addObject:button];
}

- (void)turnedOn:(id)sender
{
	PushableButton *button;
	for ( int i=0; i < _pushableButtons.count; ++i ) {
		// turn off the buttons that should go dark
		button = [_pushableButtons objectAtIndex:i];
		if ( (button != sender) && ((button.state == kPushableStateOn) || (button.state == kPushableStateTransToOn)) ) {
			[button turnColorOff];
		}
		
		// pin the selected index
		if ( button == sender ) { 
			_selected = i;
		}
	}	
	
	float sValue = 0.0f;
	switch ( self.selected ) {
		case 0:
			sValue = ((60.-4.)/632.);
			break;
		case 1:
			sValue = ((60. + 128.-4.)/632.);
			break;
		case 2:
			sValue = 0.5f;
			break;
		case 3:
			sValue = ((572.-128.+4.)/632.);
			break;
		case 4:
			sValue = ((572.+4.)/632.);
			break;
	}
	[_slider setValue:sValue animated:YES];
	
	self.right.active = TRUE;
}

- (void)dealloc {
	[_pushableButtons release];
	[_left release];
	[_right	release];
	[_slider release];
	[super dealloc];
}

@end
