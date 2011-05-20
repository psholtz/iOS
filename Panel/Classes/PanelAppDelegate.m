//
//  PanelAppDelegate.m
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PanelAppDelegate.h"
#import "PanelViewController.h"
#import "PanelControlViewController.h"

@implementation PanelAppDelegate

@synthesize window;
@synthesize panel;
@synthesize panelControl;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	// add the panels
    self.panel = [[PanelViewController alloc] initWithNibName:@"PanelViewController" bundle:nil];
	[self.window addSubview:self.panel.view];
	
	// add the control bar
	self.panelControl = [[PanelControlViewController alloc] initWithNibName:@"PanelControlViewController" bundle:nil];
	UIView *v = self.panelControl.view;
	CGRect f = v.frame;
	CGRect g = CGRectMake(0, 480 - f.size.height, f.size.width, f.size.height);
	v.frame = g;
	[self.window addSubview:self.panelControl.view];
	
	// render the window
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark Memory management
- (void)dealloc {
	[panelControl release];
	[panel release];
    [window release];
    [super dealloc];
}


@end
