//
//  MasterViewController.h
//  CurlUpDemo
//
//  Created by Engineer on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurlUpDemoAppDelegate.h"

@interface MasterViewController : UIViewController {
	UIView *container;
	UIView *child;
	UILabel *info;
	
	int count;
	
	UIAlertView *error1;
	UIAlertView *error2;
	
	UIButton *removeButton;
	UIButton *replaceButton;
	UISlider *slider;
}

@property (nonatomic,retain) IBOutlet UIView *container; 
@property (nonatomic,retain) IBOutlet UIView *child;
@property (nonatomic,retain) IBOutlet UILabel *info;

@property (nonatomic,retain) UIAlertView *error1;
@property (nonatomic,retain) UIAlertView *error2;

@property (nonatomic,retain) IBOutlet UIButton *removeButton;
@property (nonatomic,retain) IBOutlet UIButton *replaceButton;

@property (nonatomic,retain) IBOutlet UISlider *slider; 

- (IBAction)remove:(id)sender;
- (IBAction)replace:(id)sender;
- (void)updateUIRemove;
- (void)updateUIReplace; 

@end
