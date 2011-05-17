//
//  MapLinesAppDelegate.m
//  MapLines
//
//  Created by Engineer on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapLinesAppDelegate.h"
#import "MapViewController.h"

@implementation MapLinesAppDelegate

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
