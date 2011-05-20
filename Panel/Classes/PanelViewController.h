//
//  PanelViewController.h
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomScrollView;

@interface PanelViewController : UIViewController <UIScrollViewDelegate> {
	CustomScrollView *scrollView;
	
	UIView *view1; 
	UIView *view2; 
	UIView *view3;
	UIView *view4;
	UIView *view5; 
}

@property (nonatomic,retain) IBOutlet CustomScrollView *scrollView; 

@property (nonatomic,retain) IBOutlet UIView *view1; 
@property (nonatomic,retain) IBOutlet UIView *view2;
@property (nonatomic,retain) IBOutlet UIView *view3;
@property (nonatomic,retain) IBOutlet UIView *view4;
@property (nonatomic,retain) IBOutlet UIView *view5;

@end
