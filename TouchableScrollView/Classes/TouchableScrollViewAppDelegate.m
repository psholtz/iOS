//
//  TouchableScrollViewAppDelegate.m
//  TouchableScrollView
//
//

#import "TouchableScrollViewAppDelegate.h"
#import "MainViewController.h"

@implementation TouchableScrollViewAppDelegate

@synthesize window;
@synthesize viewController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    self.viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
	[self.window addSubview:self.viewController.view];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -
#pragma mark Memory management
- (void)dealloc {
	[viewController release];
    [window release];
    [super dealloc];
}


@end
