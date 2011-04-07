//
//  QuestionViewController.m
//  UCLA
//
//  Created by Buyer on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "QuestionViewController.h"
#import "Model.h"
#import "PushableButton.h"
#import "ControlGroup.h"

@implementation QuestionViewController

@synthesize question;
@synthesize label; 
@synthesize backgroundImage;
@synthesize questionNumber;
@synthesize button1;
@synthesize button2;
@synthesize button3;
@synthesize button4;
@synthesize button5;
@synthesize slider; 
@synthesize left;
@synthesize right;

- (id)initWithQuestionNumber:(int)number
{
	if ( self = [super initWithNibName:@"QuestionViewController" bundle:nil] ) {
		questionNumber = number;
		if ( number > 0 ) {
			left.active = YES;
		}
	}
	return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	label.text = @"Please tap the buttons that correctly describe how you've felt in general over the past few weeks compared to your usual best (or your idea of how people usually feel at their best). If necessary, use the slider to answer more accurately. When finished, tap 'Continue'.";
	question.text = [Model getQuestionNumber:self.questionNumber];
	
	NSArray *answers = [Model getAnswersNumber:self.questionNumber];
	button1.text = [answers objectAtIndex:0];
	button2.text = [answers objectAtIndex:1];
	button3.text = [answers objectAtIndex:2];
	button4.text = [answers objectAtIndex:3];
	button5.text = [answers objectAtIndex:4];
	
	button1.value = -2;
	button2.value = -1;
	button3.value = 0;
	button4.value = 1;
	button5.value = 2;
	
	controls = [[ControlGroup alloc] init:YES];
	[controls addPushButton:button1];
	[controls addPushButton:button2];
	[controls addPushButton:button3];
	[controls addPushButton:button4];
	[controls addPushButton:button5];
	controls.slider = self.slider;
	
	self.left.kind = ACTIVE_KIND_LEFT;
	self.right.kind = ACTIVE_KIND_RIGHT;
	controls.left = self.left;
	controls.right = self.right;
}

- (void)dealloc {
	[left release];
	[right release];
	[slider release];
	[controls release];
	[button1 release];
	[button2 release];
	[button3 release];
	[button4 release];
	[button5 release];
	[label release];
	[backgroundImage release];
	[question release];
    [super dealloc];
}
@end
