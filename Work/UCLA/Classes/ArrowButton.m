//
//  ArrowButton.m
//  UCLA
//
//  Created by Buyer on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ArrowButton.h"

@interface ArrowButton (Private)

- (void)configure;

@end

@implementation ArrowButton

@synthesize active = _active;
@synthesize duration = _duration;
@synthesize kind = _kind;
@synthesize delegate;

- (void)setActive:(BOOL)active
{
	_active = active;
	
	CATransition *animation = [CATransition animation];
	[animation setDuration:_duration];
	[animation setType:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[animation setDelegate:self];
	[self.layer addAnimation:animation forKey:@""];
	
	if ( _active ) 
	{
		self.alpha = ACTIVE_ALPHA_ACTIVE;
	}
	else 
	{
		self.alpha = ACTIVE_ALPHA_INACTIVE;
	}
}

#pragma mark -
#pragma mark Constructors
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		[self configure];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder 
{
	self = [super initWithCoder:aDecoder];
	if ( self ) {
		[self configure];
	}
	return self;
}

- (void)configure {
	self.alpha = ACTIVE_ALPHA_INACTIVE;
	self.active = FALSE;
}

#pragma mark -
#pragma mark Event management
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ( _active )
	{
		switch ( _kind )
		{
			case ACTIVE_KIND_LEFT:
				[delegate moveLeft];
				break;
			case ACTIVE_KIND_RIGHT:
				[delegate moveRight];
				break;
		}
	}
}

#pragma mark -
#pragma mark Memory management
- (void)dealloc {
    [super dealloc];
}


@end
