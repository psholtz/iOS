//
//  TouchableScrollViewAppDelegate.h
//  TouchableScrollView
//
//  Created by Engineer on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GET_DELEGATE TouchableScrollViewAppDelegate* delegate = (TouchableScrollViewAppDelegate*)[[UIApplication sharedApplication] delegate]
@class MainViewController;

@interface TouchableScrollViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController *viewController; 
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *viewController;

@end

