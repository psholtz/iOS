//
//  TouchableScrollViewAppDelegate.h
//  TouchableScrollView
//
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

