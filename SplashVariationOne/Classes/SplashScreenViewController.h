//
//  SplashScreenViewController.h
//  SplashTransition
//

#import <UIKit/UIKit.h>
#import "LoadingView.h"

@class LoadingView;
@class StartView;
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
	
	LoadingView *frameOne;
	StartView *frameTwo; 
}

@property (nonatomic,retain) UIImage *splashImage;
@property (nonatomic,assign) id<SplashScreenDelegate> delegate;
@property (nonatomic,assign) int mode; 

@property (nonatomic,retain) LoadingView *frameOne;
@property (nonatomic,retain) StartView *frameTwo; 

- (void)showInWindow:(UIWindow*)window;
- (void)performTransition;
- (void)secondTransition;

@end
