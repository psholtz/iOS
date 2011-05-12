//
//  MapDemoAppDelegate.m
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapDemoAppDelegate.h"
#import "MapViewController.h"

@implementation MapDemoAppDelegate

@synthesize window;
@synthesize map; 

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // add the view controller
	MapViewController *temp = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
	self.map = temp;
	[self.window addSubview:self.map.view];
	[temp release];
    
	// make window visible
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark Memory management
- (void)dealloc {
	[map release];
    [window release];
    [super dealloc];
}


@end
