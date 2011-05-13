//
//  DetailViewController.m
//  MapDemo
//
//  Created by Engineer on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "MapViewController.h"
#import "MapDemoAppDelegate.h"

@implementation DetailViewController

@synthesize index;
@synthesize backgroundImage;

#pragma mark -
#pragma mark Object lifecycle
- (id)initWithIndex:(int)i {
	self = [super initWithNibName:@"DetailViewController" bundle:nil];
	if ( self ) {
		self.index = i;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
			
	self.title = [[MapViewController PLACES] objectAtIndex:self.index];

	UIBarButtonItem	*item = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backBarButtonCallback)];
	self.navigationItem.leftBarButtonItem = item;
	[item release];
	
	switch ( self.index ) {
		case kMD_SanFrancisco:
			self.backgroundImage.image = [UIImage imageNamed:@"sf.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
			break; 
		case kMD_Stanford:
			self.backgroundImage.image = [UIImage imageNamed:@"stanford.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
			break;
		case kMD_LosAngeles:
			self.backgroundImage.image = [UIImage imageNamed:@"la.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
			break;
		case kMD_Rio:
			self.backgroundImage.image = [UIImage imageNamed:@"rio.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
			break;
		case kMD_NewYork:
			self.backgroundImage.image = [UIImage imageNamed:@"newyork.jpg"];
			break;
		case kMD_MIT:
			self.backgroundImage.image = [UIImage imageNamed:@"mit.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
			break;
		case kMD_Paris:
			self.backgroundImage.image = [UIImage imageNamed:@"paris.jpg"];			
			break;
		case kMD_Rome:
			self.backgroundImage.image = [UIImage imageNamed:@"vatican.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
			break;
		case kMD_Giza:
			self.backgroundImage.image = [UIImage imageNamed:@"giza.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
			break;
		case kMD_HongKong:
			self.backgroundImage.image = [UIImage imageNamed:@"hongkong.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
			break;
			
		case kMD_Seoul:
			self.backgroundImage.image = [UIImage imageNamed:@"seoul.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
			break; 
		case kMD_Tokyo:
			self.backgroundImage.image = [UIImage imageNamed:@"tokyo.jpg"];
			self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
			break;	
		case kMD_Hawaii:
			self.backgroundImage.image = [UIImage imageNamed:@"kona.jpg"];
			break;
	}
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.backgroundImage = nil;
}

- (void)dealloc {
	[backgroundImage release];
    [super dealloc];
}

#pragma mark -
#pragma mark Back Bar Button CALLBACK_API
- (void)backBarButtonCallback {
	GET_DELEGATE;
	[appDelegate.navController setNavigationBarHidden:YES animated:YES];	
	[appDelegate.navController popViewControllerAnimated:YES];
}


@end
