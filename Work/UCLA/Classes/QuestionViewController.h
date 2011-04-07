//
//  QuestionViewController.h
//  UCLA
//
//  Created by Buyer on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PushableButton;
@class ControlGroup;
@class ArrowButton;

@interface QuestionViewController : UIViewController {
	UILabel *question;	
	UILabel *label; 
	UIImageView *backgroundImage; 
	int questionNumber;
	
	PushableButton *button1;
	PushableButton *button2;
	PushableButton *button3;
	PushableButton *button4;
	PushableButton *button5;
	UISlider *slider;
	
	ControlGroup *controls;
	
	ArrowButton *left;
	ArrowButton *right;
}

@property (nonatomic,retain) IBOutlet UILabel *question;
@property (nonatomic,retain) IBOutlet UILabel *label; 
@property (nonatomic,retain) IBOutlet UIImageView *backgroundImage;
@property (nonatomic,readonly) int questionNumber;

@property (nonatomic,retain) IBOutlet PushableButton *button1;
@property (nonatomic,retain) IBOutlet PushableButton *button2;
@property (nonatomic,retain) IBOutlet PushableButton *button3;
@property (nonatomic,retain) IBOutlet PushableButton *button4;
@property (nonatomic,retain) IBOutlet PushableButton *button5;
@property (nonatomic,retain) IBOutlet UISlider *slider; 

@property (nonatomic,retain) IBOutlet ArrowButton *left;
@property (nonatomic,retain) IBOutlet ArrowButton *right;

- (id)initWithQuestionNumber:(int)questionNumber;

@end
