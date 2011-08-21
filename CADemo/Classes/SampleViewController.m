//
//  SampleViewController.m
//  CADemo
//
//  Created by Buyer on 8/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SampleViewController.h"

static float const kOrangeRadius = 10.0f;
static float const kContentRadius = 10.0f;

@implementation SampleViewController

@synthesize sublayer;
@synthesize imageLayer;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.frame = CGRectMake(0, 20, 320, 460);
	self.view.layer.backgroundColor = [UIColor orangeColor].CGColor;
	self.view.layer.cornerRadius = kOrangeRadius;
	self.view.layer.frame = CGRectInset(self.view.frame, 10.0, 10.0);

	// add a container for the iamge view;
	self.sublayer = [CALayer layer];
	[self loadShadow:kShadowOne];
	[self.view.layer addSublayer:self.sublayer];
	
	// add an image layer;
	self.imageLayer = [CALayer layer];
	self.imageLayer.frame = sublayer.bounds;
	self.imageLayer.contents = (id)[UIImage imageNamed:@"bikini.jpg"].CGImage;
	self.imageLayer.cornerRadius = kContentRadius;
	self.imageLayer.masksToBounds = YES;
	[self.sublayer addSublayer:imageLayer];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
	[sublayer release];
	[imageLayer release];
    [super dealloc];
}

#pragma mark -
#pragma mark Custom Methods
- (void)loadShadow:(int)number {
	self.sublayer.backgroundColor = [UIColor blueColor].CGColor;
	self.sublayer.frame = CGRectMake(60, 30, 180, 180);
	self.sublayer.cornerRadius = kContentRadius; 
	
	self.sublayer.shadowRadius = kContentRadius;
	self.sublayer.shadowOffset = CGSizeMake(10, 10);
	self.sublayer.shadowColor = [UIColor blackColor].CGColor;
	self.sublayer.shadowOpacity = 0.8f;
	
	UIBezierPath *path = nil;
	CGSize size = CGSizeZero;
	CGRect oval = CGRectZero;
	CGFloat curlFactor = 15.0f;
	CGFloat shadowDepth = 5.0f;
	switch ( number ) {
		case kShadowOne:
			path = [UIBezierPath bezierPathWithRect:self.sublayer.bounds];
			break;
		case kShadowTwo:
			size = self.sublayer.bounds.size; 
			path = [UIBezierPath bezierPath];
			[path moveToPoint:CGPointMake(size.width * 0.33f, size.height*0.66f)];
			[path addLineToPoint:CGPointMake(size.width * 0.66f, size.height * 0.66f)];
			[path addLineToPoint:CGPointMake(size.width * 1.15f, size.height * 1.15f)];
			[path addLineToPoint:CGPointMake(size.width * -0.15f, size.height * 1.15f)];
			break;
		case kShadowThree:
			size = self.sublayer.bounds.size;
			oval = CGRectMake(-25.0f, size.height + 5, size.width + 25, 15);
			path = [UIBezierPath bezierPathWithOvalInRect:oval];
			break;
		case kShadowFour:
			size = self.sublayer.bounds.size;
			path = [UIBezierPath bezierPath];
			[path moveToPoint:CGPointMake(0.0f, 0.0f)];
			[path addLineToPoint:CGPointMake(size.width, 0.0f)];
			[path addLineToPoint:CGPointMake(size.width, size.height + shadowDepth)];
			[path addCurveToPoint:CGPointMake(0.0f, size.height + shadowDepth) controlPoint1:CGPointMake(size.width - curlFactor, size.height + shadowDepth - curlFactor) controlPoint2:CGPointMake(curlFactor, size.height + shadowDepth - curlFactor)];
			break;
	}
	self.sublayer.shadowPath = path.CGPath;
}

#pragma mark -
#pragma mark IBAction
- (IBAction)pressOne:(id)sender {
	[self loadShadow:kShadowOne];
}

- (IBAction)pressTwo:(id)sender {
	[self loadShadow:kShadowTwo]; 
}

- (IBAction)pressThree:(id)sender {
	[self loadShadow:kShadowThree];
}

- (IBAction)pressFour:(id)sender {
	[self loadShadow:kShadowFour];
}

@end
