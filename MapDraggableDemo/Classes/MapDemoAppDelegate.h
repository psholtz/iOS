//
//  MapDemoAppDelegate.h
//  MapDemo
//
//  Created by Engineer on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapViewController;

@interface MapDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MapViewController *map; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MapViewController *map;

@end

