//
//  PushableButton.h
//  UCLA
//
//  Created by Buyer on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PUSHABLE_DEFAULT_OFF_COLOR	[UIColor colorWithRed:0.75f green:0.75f blue:0.75f alpha:1.0f]
#define PUSHABLE_DEFAULT_ON_COLOR [UIColor colorWithRed:0.32 green:0.57 blue:0.92 alpha:0.9];
#define PUSHABLE_DEFAULT_OFF_TEXT_COLOR [UIColor colorWithRed:0.1f green:0.1f blue:0.1f alpha:1.0f]
#define PUSHABLE_DEFAULT_ON_TEXT_COLOR [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0f];
#define PUSHABLE_DEFAULT_DURATION	0.4f

enum { kPushableStateOff, 
	kPushableStateTransToOn, 
	kPushableStateTransToOff, 
	kPushableStateOn };

@protocol PushableButtonDelegate

- (void)turnedOn:(id)sender;

@end

@interface PushableButton : UIView {
	UILabel *_label;
	
	int _state;
	
	float _duration; 
	
	BOOL _hold;	// whether the button stays down, once its down
	
	int _value;	// numerical value that is associated w/ this button
	
	id<PushableButtonDelegate> _delegate;	// delegate object
}
@property ( nonatomic, retain ) NSString *text;

@property ( nonatomic, readonly ) int state;
@property ( nonatomic, assign ) float duration;
@property ( nonatomic, assign ) BOOL hold; 
@property ( nonatomic, assign ) int value;

@property ( nonatomic, retain ) id<PushableButtonDelegate> delegate;

- (void)turnColorOff;
- (void)turnColorOn;

@end
