//
//  LeftViewController.m
//  CurlUpDemo
//
//  Created by Engineer on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "LeftViewController.h"

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// set distinguishing background color
	self.view.backgroundColor = [UIColor grayColor];
}

#pragma mark -
#pragma mark IBAction methods
- (IBAction)remove:(id)sender
{
	if ( count == 0 ) 
	{
		// USE UIVIEW TO REMOVE THE COVER; 
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:ANIMATION_DURATION];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.container cache:YES];
		
		[child removeFromSuperview];
		[self updateUIRemove];	
		
		[UIView commitAnimations];
	}
	else 
	{
		[error1 show];
	}
}

- (IBAction)replace:(id)sender 
{
	if ( count != 0 ) 
	{
		// USE UIVIEW TO ADD THE COVER BACK
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:ANIMATION_DURATION];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.container cache:YES];
		
		[self.container addSubview:child];
		[self updateUIReplace];
		
		[UIView commitAnimations];
	}	
	else 
	{
		[error2 show];
	}
}


#pragma mark -
#pragma mark Memory management
- (void)dealloc {
    [super dealloc];
}

@end
