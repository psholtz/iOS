//
//  PanelControlViewController.m
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PanelAppDelegate.h"
#import "PanelViewController.h"
#import "PanelControlViewController.h"
#import "CustomScrollView.h"
#import "ControlGroup.h"

@implementation PanelControlViewController

@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;

@synthesize currentSelection;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	currentSelection = 1;
	
	controls = [[[ControlGroup alloc] init] retain];
	[controls addButton:self.button1];
	[controls addButton:self.button2];
	[controls addButton:self.button3];
	[controls addButton:self.button4];
	[controls addButton:self.button5];
	
	[button1 touchDown];
	[button2 touchUp];
	[button3 touchUp];
	[button4 touchUp];
	[button5 touchUp];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	self.button1 = nil;
	self.button2 = nil;
	self.button3 = nil;
	self.button4 = nil;
	self.button5 = nil;
}

- (void)dealloc {
	[controls release];
	[button1 release];
	[button2 release];
	[button3 release];
	[button4 release];
	[button5 release];
    [super dealloc];
}

#pragma mark -
#pragma mark TouchButton Delegate
- (void)touchButtonTapped:(id)sender {
	GET_DELEGATE;
	if ( !appDelegate.panel.scrollView.isScrolling ) { 
		
		CGRect leftRect = CGRectMake(2 * 320, 0, 320, 480);
		CGRect rightRect = CGRectMake(0, 0, 320, 480);
	
		if ( appDelegate.panel.scrollView.isScrolling ) { return; } 
	
		if ( self.button1 == sender ) {
			if ( currentSelection != 1 ) { 
				[appDelegate.panel.scrollView removeSubviewsAtPosition:0];
				appDelegate.panel.view1.frame = rightRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view1];
				[appDelegate.panel.scrollView scrollToRight];
		
				[controls buttonTapped:0];
		
				currentSelection = 1;
			}
			return;
		}
	
		if ( self.button2 == sender ) {
			if ( currentSelection < 2 ) { 
				[appDelegate.panel.scrollView removeSubviewsAtPosition:2];
				appDelegate.panel.view2.frame = leftRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view2];
				[appDelegate.panel.scrollView scrollToLeft];
			} else if ( currentSelection > 2 ) {
				[appDelegate.panel.scrollView removeSubviewsAtPosition:0];
				appDelegate.panel.view2.frame = rightRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view2];
				[appDelegate.panel.scrollView scrollToRight];
			}
		
			[controls buttonTapped:1];
		
			currentSelection = 2;
			return; 
		}
	
		if ( self.button3 == sender ) {
			if ( currentSelection < 3 ) {
				[appDelegate.panel.scrollView removeSubviewsAtPosition:2];
				appDelegate.panel.view3.frame = leftRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view3];
				[appDelegate.panel.scrollView scrollToLeft];
			} else if ( currentSelection > 3 ) {
				[appDelegate.panel.scrollView removeSubviewsAtPosition:0];
				appDelegate.panel.view3.frame = rightRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view3];
				[appDelegate.panel.scrollView scrollToRight];
			}
		
			[controls buttonTapped:2];
		
			currentSelection = 3; 
			return;
		}
	
		if ( self.button4 == sender ) {
			if ( currentSelection < 4 ) { 
				[appDelegate.panel.scrollView removeSubviewsAtPosition:2];
				appDelegate.panel.view4.frame = leftRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view4];
				[appDelegate.panel.scrollView scrollToLeft];
			} else if ( currentSelection > 4 ) {
				[appDelegate.panel.scrollView removeSubviewsAtPosition:0];
				appDelegate.panel.view4.frame = rightRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view4];
				[appDelegate.panel.scrollView scrollToRight];
			}
		
			[controls buttonTapped:3];

			currentSelection = 4; 
			return;
		}
	
		if ( self.button5 == sender ) {
			if ( currentSelection != 5 ) { 
				[appDelegate.panel.scrollView removeSubviewsAtPosition:2];
				appDelegate.panel.view5.frame = leftRect;
				[appDelegate.panel.scrollView addSubview:appDelegate.panel.view5];
				[appDelegate.panel.scrollView scrollToLeft];
		
				[controls buttonTapped:4];

				currentSelection = 5;
			}
			return;
		}
	}
}

- (BOOL)canStartTouch {
	GET_DELEGATE;
	return !appDelegate.panel.scrollView.isScrolling;
}

@end
