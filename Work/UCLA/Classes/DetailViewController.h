//
//  DetailViewController.h
//  UCLA
//
//  Created by Buyer on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrowButton.h"

@interface DetailViewController : UIViewController <UIScrollViewDelegate,UIPopoverControllerDelegate, UISplitViewControllerDelegate, ArrowButtonDelegate> {
    
    UIPopoverController *popoverController;
    UIToolbar *toolbar;
    
    id detailItem;
	
	UIScrollView *scrollView;
	NSMutableArray *viewControllers;
	int totalControllers;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property (nonatomic, retain) id detailItem;

@property (nonatomic,retain) IBOutlet UIScrollView *scrollView; 
@property (nonatomic,retain) NSMutableArray *viewControllers;

- (void)loadScrollViewWithPage:(int)page;

@end
