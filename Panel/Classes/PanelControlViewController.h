//
//  PanelControlViewController.h
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchButton.h"

@class ControlGroup;

@interface PanelControlViewController : UIViewController {
	TouchButton *button1;
	TouchButton *button2;
	TouchButton *button3;
	TouchButton *button4;
	TouchButton *button5;
	
	int currentSelection; 
	
	ControlGroup *controls; 
}

@property (nonatomic,retain) IBOutlet TouchButton *button1;
@property (nonatomic,retain) IBOutlet TouchButton *button2;
@property (nonatomic,retain) IBOutlet TouchButton *button3;
@property (nonatomic,retain) IBOutlet TouchButton *button4;
@property (nonatomic,retain) IBOutlet TouchButton *button5;

@property (nonatomic,assign) int currentSelection;

@end
