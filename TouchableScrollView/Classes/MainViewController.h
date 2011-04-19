//
//  MainViewController.h
//  TouchableScrollView
//
//  Created by Engineer on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchableScrollView;

@interface MainViewController : UIViewController <UIScrollViewDelegate> {
	TouchableScrollView *scrollView;
	
	NSMutableArray *controllers;
	
	int _currentPage; 
}

@property (nonatomic,retain) IBOutlet TouchableScrollView *scrollView;
@property (nonatomic,retain) NSMutableArray *controllers; 
@property (nonatomic,readonly) int currentPage; 

- (void)loadViewController:(int)page;

@end
