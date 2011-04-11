//
//  RightViewController.m
//  CurlUpDemo
//

#import <QuartzCore/QuartzCore.h>
#import "RightViewController.h"


@implementation RightViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
		
	// set distinguishing background color
	self.view.backgroundColor = [UIColor colorWithRed:(144./255.) green:(238./255.) blue:(144./255.) alpha:1.0f];

	self.slider.enabled = YES;
	transitionPoint = self.slider.value;
}

#pragma mark -
#pragma mark IBAction methods
- (IBAction)remove:(id)sender
{
	if ( count == 0 ) 
	{
		transitionPoint = self.slider.value;
		
		float d = ANIMATION_DURATION * transitionPoint;
		d = d < 0.25 ? 0.25 : d;
		
		// USE CORE ANIMATION TO REMOVE THE COVER; 
		CATransition *animation = [CATransition animation];
		[animation setDelegate:self];
		[animation setDuration:d];
		[animation setTimingFunction:UIViewAnimationCurveEaseInOut];
		[animation setType:@"pageCurl"];
		[animation setRemovedOnCompletion:NO];
		[animation setFillMode:kCAFillModeForwards];
		animation.endProgress = transitionPoint;
		[container.layer addAnimation:animation forKey:@"pageFlipAnimation"];
	
		// Fade the controls in and out as well;
		// This looks a bit goofy, but we could probably polish it up if we really wanted to. 
		// (i.e., the "highlight" on the buttons doesn't fade out quite how we'd like)
		CATransition *fade = [CATransition animation];
		[fade setDelegate:self];
		[fade setDuration:d];
		[fade setTimingFunction:UIViewAnimationCurveEaseInOut];
		[fade setType:@"fade"];
		[fade setRemovedOnCompletion:NO];
		[removeButton.layer addAnimation:fade forKey:@"fade"];
		[replaceButton.layer addAnimation:fade forKey:@"fade"];
		[slider.layer addAnimation:fade forKey:@"fade"];
		
		// do the swaps that we actually want
		[child removeFromSuperview];
		[self updateUIRemove];	
	}
	else 
	{
		[error1 show];
	}
}

- (IBAction)replace:(id)sender 
{
	if ( count != 0 ) 
	{
		float d = ANIMATION_DURATION * transitionPoint;
		d = d < 0.25 ? 0.25 : d;
		
		// USE CORE ANIMATION TO ADD THE COVER BACK
		CATransition *animation = [CATransition animation];
		[animation setDelegate:self];
		[animation setDuration:d];
		[animation setTimingFunction:UIViewAnimationCurveEaseInOut];
		[animation setType:@"pageUnCurl"];
		[animation setRemovedOnCompletion:NO];
		[animation setFillMode:kCAFillModeBackwards];
		animation.startProgress = 1 - transitionPoint;
		[container.layer addAnimation:animation forKey:@"pageFlipAnimation"];
		
		// Fade the controls in and out as well;
		// This looks a bit goofy, but we could probably polish it up if we really wanted to. 
		// (i.e., the "highlight" on the buttons doesn't fade out quite how we'd like)
		CATransition *fade = [CATransition animation];
		[fade setDelegate:self];
		[fade setDuration:d];
		[fade setTimingFunction:UIViewAnimationCurveEaseInOut];
		[fade setType:@"fade"];
		[fade setRemovedOnCompletion:NO];
		[removeButton.layer addAnimation:fade forKey:@"fade"];
		[replaceButton.layer addAnimation:fade forKey:@"fade"];
		[slider.layer addAnimation:fade forKey:@"fade"];
		
		// do the swaps that we actually want
		[self.container addSubview:child];
		[self updateUIReplace];
	}	
	else 
	{
		[error2 show];
	}
}

- (void)updateUIRemove {
	[super updateUIRemove];
	self.slider.enabled = NO; 
}
- (void)updateUIReplace {
	[super updateUIReplace];
	self.slider.enabled = YES;
}

#pragma mark -
#pragma mark Memory Management
- (void)dealloc {
    [super dealloc];
}


@end
