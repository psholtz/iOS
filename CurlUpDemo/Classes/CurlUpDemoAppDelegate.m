//
//  CurlUpDemoAppDelegate.m
//  CurlUpDemo
//
//  Created by Engineer on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurlUpDemoAppDelegate.h"

@implementation CurlUpDemoAppDelegate

@synthesize window;
@synthesize tabBarController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
    
	//NSLog(@"++ here: %@",[self.tabBarController.toolbarItems objectAtIndex:0]);
	//NSLog(@"++ %f",[self.tabBarController.toolbarItems objectAtIndex:0].view.frame.height);
    return YES;
}


#pragma mark -
#pragma mark Memory management
- (void)dealloc {
	[tabBarController release];
    [window release];
    [super dealloc];
}


@end
