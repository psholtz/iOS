//
//  DetailViewController.m
//  TouchableScrollView
//
//  Created by Engineer on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "TouchableScrollViewAppDelegate.h"
#import "MainViewController.h"
#import "DetailViewController.h"
#import "TouchableScrollView.h"
#import "GuardedView.h"

@implementation DetailViewController

@synthesize pageNumber;

@synthesize pageLabel;
@synthesize valueLabel;
@synthesize descLabel; 
@synthesize slider; 
@synthesize control; 
@synthesize guard; 

NSString *DESC = @"Using the slider with the Guard On is a lot easier than with the Guard Off!";

float DURATION = 0.5f;

#pragma mark -
#pragma mark Constructors and Configuration
- (id)initWithPageNumber:(int)page {
	self = [super initWithNibName:@"DetailViewController" bundle:nil];
	if ( self ) {
		self.pageNumber = page;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// configure text labels; 
	pageLabel.text = [NSString stringWithFormat:@"Page %d",(self.pageNumber+1)];
	valueLabel.text = [NSString stringWithFormat:@"Value: %0.2f",self.slider.value];
	descLabel.text = DESC;
	
	// configure the TouchableScrollView
	GET_DELEGATE;
	//delegate.viewController.scrollView.guard = self.guard;
	[delegate.viewController.scrollView addGuardedView:self.guard];
	
	// configure the rounded corners; 
	[self.guard.layer setBorderColor:[[UIColor colorWithRed:0.0f green:0.8f blue:0.0f alpha:1.0f] CGColor]];
	[self.guard.layer setBorderWidth:2.0f];
	[self.guard.layer setCornerRadius:8.0f];
	[self.guard.layer setMasksToBounds:YES];
}

- (void)dealloc {
	[control release];
	[descLabel release];
	[slider release];
	[guard release];
	[valueLabel release];
	[pageLabel release];
    [super dealloc];
}

#pragma mark -
#pragma mark IBAction methods
- (IBAction)sliderMoved:(id)sender
{
	valueLabel.text = [NSString stringWithFormat:@"Value: %0.2f",self.slider.value];
}

- (IBAction) toggleSwitch:(id)sender
{
	if ( self.control.on )
		[self turnOnGuard]; 
	else 
		[self turnOffGuard];
}

#pragma mark -
#pragma mark UIControl methods
- (void)turnOffGuard {
	CATransition *fade = [CATransition animation];
	[fade setType:kCATransitionFade];
	[fade setDelegate:self];
	[fade setDuration:DURATION];
	[self.guard.layer addAnimation:fade forKey:@""];
	
	self.guard.alpha = 0.0f;
	self.guard.active = FALSE; 
}

- (void)turnOnGuard {
	CATransition *fade = [CATransition animation];
	[fade setType:kCATransitionFade];
	[fade setDelegate:self];
	[fade setDuration:DURATION];
	[self.guard.layer addAnimation:fade forKey:@""];
	
	self.guard.alpha = 1.0f;
	self.guard.active = TRUE;
}

@end
