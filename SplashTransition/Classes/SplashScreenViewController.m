//
//  SplashScreenViewController.m
//  SplashTransition
//

#import <QuartzCore/QuartzCore.h>
#import "SplashScreenViewController.h"


@implementation SplashScreenViewController

static NSString *kSplashScreenFadeAnimation = @"SplashScreenFadeAnimation";
static int kSplashScreenFadeDuration = 2.0f;

enum { kSplashScreenFadeMode };

@synthesize delegate;
@synthesize splashImage;
@synthesize mode;

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
	if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ) { 
		self.view.frame = CGRectMake(0, 0, 768, 1024);
	} else { 
		self.view.frame = CGRectMake(0, 0, 320, 480);
	}
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
	
	self.view.alpha = 0.0f;
	
	[UIView commitAnimations];
}

- (void)splashFadeDidStop:(NSString*)animationID
				 finished:(BOOL)finished
				  context:(void*)context {
	[self.view removeFromSuperview];
	if ( [self.delegate respondsToSelector:@selector(splashScreenDidDisappear:)] ) {
		[self.delegate splashScreenDidDisappear:self];
	}
}



@end
