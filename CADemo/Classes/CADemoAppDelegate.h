//
//  CADemoAppDelegate.h
//  CADemo
//
//  Created by Buyer on 8/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SampleViewController;

@interface CADemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SampleViewController *sample; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SampleViewController *sample; 

@end

