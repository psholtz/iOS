//
//  PanelAppDelegate.h
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define GET_DELEGATE PanelAppDelegate *appDelegate = (PanelAppDelegate*)[[UIApplication sharedApplication] delegate]

@class PanelViewController;
@class PanelControlViewController;
 
@interface PanelAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	PanelViewController *panel;
	PanelControlViewController *panelControl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) PanelViewController *panel;
@property (nonatomic, retain) PanelControlViewController *panelControl;

@end

