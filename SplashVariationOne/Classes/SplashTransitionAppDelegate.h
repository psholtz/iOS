//
//  SplashTransitionAppDelegate.h
//  SplashTransition
//

#import <UIKit/UIKit.h>

@class SplashScreenViewController;

@interface SplashTransitionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashScreenViewController *splashController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) SplashScreenViewController *splashController;

@end

