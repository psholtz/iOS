//
//  SplashScreenViewController.h
//  SplashTransition
//

#import <UIKit/UIKit.h>

@class SplashScreenViewController;

@protocol SplashScreenDelegate

@required
- (BOOL)respondsToSelector:(SEL)aSelector;

@optional
- (void)splashScreenDidAppear:(SplashScreenViewController*)splashScreen;
- (void)splashScreenWillDisappear:(SplashScreenViewController*)splashScreen;
- (void)splashScreenDidDisappear:(SplashScreenViewController*)splashScreen;

@end

@interface SplashScreenViewController : UIViewController {
	UIImage *splashImage;
	int mode; 
}

@property (nonatomic,retain) UIImage *splashImage;
@property (nonatomic,assign) id<SplashScreenDelegate> delegate;
@property (nonatomic,assign) int mode; 

- (void)showInWindow:(UIWindow*)window;
- (void)performTransition;

@end
