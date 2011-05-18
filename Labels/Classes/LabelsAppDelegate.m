//
//  LabelsAppDelegate.m
//  Labels
//
//  Created by Engineer on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelsAppDelegate.h"
#import "LabelViewController.h"

@implementation LabelsAppDelegate

@synthesize window;
@synthesize label;

#pragma mark -
#pragma mark Application lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    self.label = [[LabelViewController alloc] initWithNibName:@"LabelViewController" bundle:nil];
	[self.window addSubview:self.label.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}


#pragma mark -
#pragma mark Memory management
- (void)dealloc {
	[label release];
    [window release];
    [super dealloc];
}


@end
