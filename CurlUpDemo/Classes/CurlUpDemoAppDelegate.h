//
//  CurlUpDemoAppDelegate.h
//  CurlUpDemo
//

#import <UIKit/UIKit.h>

#define ALPHA_ON 1.0f
#define ALPHA_OFF 0.5f
#define ANIMATION_DURATION 1.0f

@interface CurlUpDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end

