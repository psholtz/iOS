//
//  PanelViewController.m
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PanelViewController.h"
#import "CustomScrollView.h"


@implementation PanelViewController

@synthesize scrollView; 

@synthesize view1;
@synthesize view2; 
@synthesize view3;
@synthesize view4;
@synthesize view5;

#pragma mark -
#pragma mark Constructors and Management
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	scrollView.scrollEnabled = NO;
	scrollView.pagingEnabled = YES;
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.delegate = self;
	scrollView.scrollsToTop = NO;
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 3, scrollView.frame.size.height);
	
	CGRect f = CGRectMake(320, 0, 320, 480);
	view1.frame = f;
	[scrollView addSubview:view1];
	[scrollView scrollRectToVisible:f animated:NO]; 
	
	scrollView.isScrolling = FALSE; 
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	self.scrollView = nil; 
	self.view1 = nil;
	self.view2 = nil;
	self.view3 = nil;
	self.view4 = nil;
	self.view5 = nil;
}

- (void)dealloc {
	[view5 release];
	[view4 release];
	[view3 release];
	[view2 release];
	[view1 release]; 
	[scrollView release];
    [super dealloc];
}

#pragma mark -
#pragma mark ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
	if ( aScrollView == self.scrollView ) { 
		scrollView.isScrolling = YES;	
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView {
	if ( aScrollView == self.scrollView ) { 
		scrollView.isScrolling = NO;
	}
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)aScrollView {
	if ( aScrollView == self.scrollView ) { 
		scrollView.isScrolling = NO; 
	
		if ( scrollView.movingLeft ) {
			[scrollView	postAdjustForLeft];
		} else if ( scrollView.movingRight ) {
			[scrollView postAdjustForRight];
		}
	}
}

@end
