//
//  MapDemoAppDelegate.h
//  MapDemo
//
//  Created by Engineer on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GET_DELEGATE MapDemoAppDelegate *appDelegate = (MapDemoAppDelegate*)[[UIApplication sharedApplication] delegate]

@class MapViewController;

@interface MapDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navController; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

