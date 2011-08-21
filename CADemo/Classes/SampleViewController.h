//
//  SampleViewController.h
//  CADemo
//
//  Created by Buyer on 8/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

enum { kShadowOne, kShadowTwo, kShadowThree, kShadowFour };

@interface SampleViewController : UIViewController {
	CALayer *sublayer;
	CALayer *imageLayer;
}

@property (nonatomic,retain) CALayer *sublayer;
@property (nonatomic,retain) CALayer *imageLayer;

#pragma mark -
#pragma mark Custom Methods
- (void)loadShadow:(int)number;

#pragma mark -
#pragma mark IBAction
- (IBAction)pressOne:(id)sender;
- (IBAction)pressTwo:(id)sender;
- (IBAction)pressThree:(id)sender;
- (IBAction)pressFour:(id)sender;

@end
