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
@synthesize navController;
 
#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // add the view controller
	[self.window addSubview:self.navController.view];
	
	// make window visible
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark Memory management
- (void)dealloc {
	[navController release];
    [window release];
    [super dealloc];
}


@end
