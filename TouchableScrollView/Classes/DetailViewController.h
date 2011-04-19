//
//  DetailViewController.h
//  TouchableScrollView
//
//  Created by Engineer on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuardedView;

@interface DetailViewController : UIViewController {
	int pageNumber; 
	
	UILabel *pageLabel; 
	UILabel *valueLabel; 
	UILabel *descLabel; 
	UISlider *slider; 
	UISwitch *control;
	
	GuardedView *guard; 
}

@property (nonatomic,assign) int pageNumber; 

@property (nonatomic,retain) IBOutlet UILabel *pageLabel;
@property (nonatomic,retain) IBOutlet UILabel *valueLabel;
@property (nonatomic,retain) IBOutlet UILabel *descLabel; 
@property (nonatomic,retain) IBOutlet UISlider *slider; 
@property (nonatomic,retain) IBOutlet UISwitch *control; 

@property (nonatomic,retain) IBOutlet GuardedView *guard; 

- (id)initWithPageNumber:(int)page;
- (IBAction)sliderMoved:(id)sender; 
- (IBAction)toggleSwitch:(id)sender;

- (void)turnOffGuard;
- (void)turnOnGuard;

@end
