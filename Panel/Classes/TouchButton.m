//
//  TouchButton.m
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TouchButton.h"

@implementation TouchButton

static float const kAnimationDuration = 0.2f;

@synthesize delegate;

#pragma mark -
#pragma mark Constructors
- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if ( self ) { 
		[self configure];
	}
	return self; 
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if ( self ) {
		[self configure];
	}
	return self;
}

- (void)configure {
	
}

#pragma mark -
#pragma mark Event Management
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if ( [delegate canStartTouch] ) {
		[self touchDown];
	
		[delegate touchButtonTapped:self];
	}
}

#pragma mark -
#pragma mark UI Management
- (void)touchDown {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kAnimationDuration];
	
	self.backgroundColor = COLOR_DOWN;
	
	[UIView commitAnimations];
}

- (void)touchUp {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kAnimationDuration];
	
	self.backgroundColor = COLOR_UP;
	
	[UIView commitAnimations];
}

@end
