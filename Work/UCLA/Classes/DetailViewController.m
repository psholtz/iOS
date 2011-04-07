//
//  DetailViewController.m
//  UCLA
//
//  Created by Buyer on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"
#import "QuestionViewController.h"

static NSUInteger kNumberOfPages = 20;

@interface DetailViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;


@end

@implementation DetailViewController

@synthesize toolbar, popoverController, detailItem;
@synthesize scrollView;
@synthesize viewControllers;

#pragma mark -
#pragma mark Managing the detail item

- (void) moveLeft 
{
	NSLog(@"++ move left");
}

- (void) moveRight
{
	NSLog(@"++ move right");
}

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(id)newDetailItem {
    if (detailItem != newDetailItem) {
        [detailItem release];
        detailItem = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }        
}


- (void)configureView {
    // Update the user interface for the detail item.
       
}


#pragma mark -
#pragma mark Split view support

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    
    barButtonItem.title = @"Root List";
    NSMutableArray *items = [[toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}


// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    NSMutableArray *items = [[toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}


#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark View lifecycle


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	scrollView.backgroundColor = [UIColor blackColor];
	
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	for ( int i=0; i < kNumberOfPages; ++i ) {
		[controllers addObject:[NSNull null]];
	}
	self.viewControllers = controllers;
	[controllers release];
	
	scrollView.pagingEnabled = YES;
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 1, scrollView.frame.size.height);
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.scrollsToTop = NO;
	scrollView.scrollEnabled = YES;
	scrollView.delegate = self;
	
	[self loadScrollViewWithPage:0];
}
 
- (void)loadScrollViewWithPage:(int)page 
{
	// do checks on the bounds;
	if ( page < 0 ) return;
	if ( page > kNumberOfPages ) return;
	
	//if ( page > 0 ) { totalControllers++; } 
	//scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * totalControllers, scrollView.frame.size.height);
	
	QuestionViewController *question = [[QuestionViewController alloc] initWithQuestionNumber:page];
	question.view.backgroundColor = [UIColor blackColor];
	question.left.delegate = self;
	question.right.delegate = self;
	[scrollView addSubview:question.view];
	[question release];
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.popoverController = nil;
}


#pragma mark -
#pragma mark Memory management
- (void)dealloc {
	[scrollView release];
	
    [popoverController release];
    [toolbar release];
    
    [detailItem release];
    [super dealloc];
}

@end
