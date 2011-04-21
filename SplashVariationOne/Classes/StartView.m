//
//  StartView.m
//  SplashTransition
//
//  Created by Engineer on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "StartView.h"


@implementation StartView

@synthesize info;

#pragma mark -
#pragma mark Constructors and Configuration; 
- (id) initWithFrame:(CGRect)f {
	self = [super initWithFrame:f];
	if ( self ) {
		[self configure];
	}
	return self;
}

- (void)configure {
	self.layer.cornerRadius = 4.0f;
	self.layer.borderWidth = 2.0f;
	self.layer.borderColor = [[UIColor grayColor] CGColor];
	
	self.backgroundColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
	
	self.info = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
	self.info.textAlignment = UITextAlignmentCenter;
	self.info.text = @"Start";
	self.info.font = [UIFont boldSystemFontOfSize:17.0f];
	self.info.backgroundColor = [UIColor clearColor];
	[self addSubview:self.info];
}

- (void)dealloc {
	[info release];
	[super dealloc];
}

#pragma mark -
#pragma mark Event Management
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"++ START");
}

@end
