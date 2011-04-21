//
//  SplashScreenViewController.m
//  SplashTransition
//

#import <QuartzCore/QuartzCore.h>
#import "SplashScreenViewController.h"
#import "LoadingView.h"
#import "StartView.h"

@implementation SplashScreenViewController

static NSString *kSplashScreenFadeAnimation = @"SplashScreenFadeAnimation";
static int kSplashScreenFadeDuration = 1.0f;

enum { kSplashScreenFadeMode };

@synthesize delegate;
@synthesize splashImage;
@synthesize mode;

@synthesize frameOne;
@synthesize frameTwo; 

#pragma mark -
#pragma mark Synthesize
// lazy initializer
- (UIImage*)splashImage {
	if ( splashImage == nil ) {
		NSString *defaultPath = [[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"];
		splashImage = [[UIImage alloc] initWithContentsOfFile:defaultPath];
	}
	return splashImage;
}

#pragma mark -
#pragma mark Construction and Configuration
- (void)viewDidLoad {	
	self.view.layer.contents = (id)self.splashImage.CGImage;
	self.view.contentMode = UIViewContentModeBottom;
	self.view.frame = CGRectMake(0, 0, 320, 480);
	
	self.frameOne = [[LoadingView alloc] initWithFrame:CGRectMake(10,420,300,50)];
	self.frameOne.alpha = 0.0f;
	[self.view addSubview:self.frameOne];
	
	self.frameTwo = [[StartView alloc] initWithFrame:CGRectMake(10,420,300,50)];
	self.frameTwo.alpha = 0.0f;
	[self.view addSubview:self.frameTwo];
}

- (void)viewDidAppear:(BOOL)animated {
	if ( [self.delegate respondsToSelector:@selector(splashScreenDidAppear:)] ) {
		[self.delegate splashScreenDidAppear:self];
	}
	if ( [self.delegate respondsToSelector:@selector(splashScreenWillDisappear:)] ) {
		[self.delegate splashScreenWillDisappear:self];
	}
	[self performTransition];
}

- (void)dealloc {
	[frameOne release];
	[frameTwo release];
	[splashImage release];
    [super dealloc];
}

#pragma mark -
#pragma mark Custom APIs
- (void)showInWindow:(UIWindow*)window {
	[window addSubview:self.view];
}

- (void)performTransition {
	[UIView beginAnimations:kSplashScreenFadeAnimation context:nil];
	[UIView setAnimationDuration:kSplashScreenFadeDuration];
	[UIView setAnimationDelegate:self];
	SEL stopSelector = @selector(splashFadeDidStop:finished:context:);
	[UIView setAnimationDidStopSelector:stopSelector];
	
	self.frameOne.alpha = 1.0f;
	
	[UIView commitAnimations];
}

- (void)splashFadeDidStop:(NSString*)animationID
				 finished:(BOOL)finished
				  context:(void*)context {

	[NSTimer scheduledTimerWithTimeInterval:2.0f 
									 target:self
								   selector:@selector(secondTransition)
								   userInfo:nil
									repeats:NO];
}

- (void)secondTransition {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kSplashScreenFadeDuration];
	
	self.frameOne.alpha = 0.0f;
	self.frameTwo.alpha = 1.0f;
	
	[UIView commitAnimations];
}

@end
