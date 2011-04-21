//
//  SplashTransitionAppDelegate.m
//  SplashTransition
//

#import "SplashTransitionAppDelegate.h"
#import "SplashScreenViewController.h"

@implementation SplashTransitionAppDelegate

@synthesize window;
@synthesize splashController; 

#pragma mark -
#pragma mark Application lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	self.splashController = [[SplashScreenViewController alloc] init];
	[self.splashController showInWindow:self.window];
	
	[NSThread sleepForTimeInterval:2.0f];
	
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)dealloc {
	[splashController release];
    [window release];
    [super dealloc];
}

@end
