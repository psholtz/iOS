//
//  LabelsAppDelegate.h
//  Labels
//
//  Created by Engineer on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LabelViewController;

@interface LabelsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	LabelViewController *label;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) LabelViewController *label;

@end

