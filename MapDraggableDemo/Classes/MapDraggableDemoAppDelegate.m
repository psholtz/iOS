//
//  MapDraggableDemoAppDelegate.m
//  MapDraggableDemo
//
//  Created by Engineer on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapDraggableDemoAppDelegate.h"
#import "MapViewController.h"

@implementation MapDraggableDemoAppDelegate

@synthesize window;
@synthesize map; 

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	MapViewController *temp = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
	self.map = temp;
	[self.window addSubview:self.map.view];
	[temp release];
    
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
