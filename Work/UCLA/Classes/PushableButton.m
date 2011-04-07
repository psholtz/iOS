//
//  PushableButton.m
//  UCLA
//
//  Created by Buyer on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PushableButton.h"

@interface PushableButton (Private)

- (void)configure;

@end

@implementation PushableButton

- (void) setText:(NSString *)t
{
	_label.text = t;
}

- (NSString*) text 
{
	return _label.text;
}

@synthesize state = _state;
@synthesize duration = _duration;
@synthesize hold = _hold;
@synthesize value = _value;
@synthesize delegate = _delegate;

static float CORNER_RADIUS = 8.0f;

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
    if (self) {
        // Initialization code.
		[self configure];
    }
    return self;
}

- (void)configure
{
	self.layer.cornerRadius = CORNER_RADIUS;
	self.layer.borderWidth = 4;
	self.layer.borderColor = [[UIColor colorWithRed:0.4f green:0.4f blue:0.4f alpha:1.0f] CGColor];
	self.backgroundColor = PUSHABLE_DEFAULT_OFF_COLOR;
	
	// configure a text frame; 
	float margin = 8;
	CGRect rect = CGRectMake(margin/2., 0, self.frame.size.width-margin, self.frame.size.height);	
	_label = [[UILabel alloc] initWithFrame:rect];
	_label.backgroundColor = [UIColor clearColor];
	_label.textAlignment = UITextAlignmentCenter;
	_label.numberOfLines = 0;
	_label.font = [UIFont boldSystemFontOfSize:18.0f];
	_label.textColor = PUSHABLE_DEFAULT_OFF_TEXT_COLOR;
	
	// set the state
	_state = kPushableStateOff;
	_duration = PUSHABLE_DEFAULT_DURATION;
	_hold = FALSE;
	_value = 1;
	
	[self addSubview:_label];
}

- (void)turnColorOff
{
	_state = kPushableStateTransToOff;
	
	CATransition *animation = [CATransition animation];
	[animation setDuration:_duration];
	[animation setType:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[animation setDelegate:self];
	[self.layer addAnimation:animation forKey:@""];
	[_label.layer addAnimation:animation forKey:@""];
	
	self.backgroundColor = PUSHABLE_DEFAULT_OFF_COLOR;
	_label.textColor = PUSHABLE_DEFAULT_OFF_TEXT_COLOR;
}

- (void)turnColorOn
{
	_state = kPushableStateTransToOn;
	
	CATransition *animation = [CATransition animation];
	[animation setDuration:_duration];
	[animation setType:kCATransitionFade];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[animation setDelegate:self];
	[self.layer addAnimation:animation forKey:@""];
	[_label.layer addAnimation:animation forKey:@""];
	
	self.backgroundColor = PUSHABLE_DEFAULT_ON_COLOR;
	_label.textColor = PUSHABLE_DEFAULT_ON_TEXT_COLOR;
	
	[self.delegate turnedOn:self];
}

#pragma mark -
#pragma mark CAANimation Delegates
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
	if ( _state == kPushableStateTransToOn ) 
	{
		if ( flag ) 
		{ 
			_state = kPushableStateOn; 
			
		}
	}
	else if ( _state == kPushableStateTransToOff ) 
	{
		if ( flag ) 
		{ 
			_state = kPushableStateOff; 
		}
	}
}

#pragma mark -
#pragma mark Event management
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if ( (_state == kPushableStateOn) && !_hold )
	{
		[self turnColorOff];
	}
	
	else if ( _state == kPushableStateOff )
	{	
		[self turnColorOn];
		
	}
}

- (void)dealloc {
	[_label release];
    [super dealloc];
}


@end
