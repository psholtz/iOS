//
//  ControlGroup.h
//  UCLA
//
//  Created by Buyer on 4/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushableButton.h"
#import "ArrowButton.h"

#define PUSHABLE_UNINITIALIZED_VALUE -999

@interface ControlGroup : NSObject <PushableButtonDelegate> {
	NSMutableArray *_pushableButtons;
	
	BOOL _holdButtons;
	int _selected;
	int _value; 
	
	UISlider *_slider;
	
	ArrowButton	*_left;
	ArrowButton	*_right;
}

@property ( nonatomic, readonly ) BOOL hold;
@property ( nonatomic, readonly ) int selected;
@property ( nonatomic, readonly ) int value; 
@property ( nonatomic, retain ) UISlider *slider;
@property ( nonatomic, retain ) ArrowButton *left;
@property ( nonatomic, retain ) ArrowButton *right;

- (id) init:(BOOL)holdButtons;
- (void) addPushButton:(PushableButton*)button;

@end
