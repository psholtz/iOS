//
//  TouchButton.h
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COLOR_DOWN		[UIColor blueColor]
#define COLOR_UP		[UIColor redColor];

@protocol TouchButtonDelegate

@required
- (void)touchButtonTapped:(id)sender;
- (BOOL)canStartTouch;

@end

enum { kStateUp, kStateDown };
				  
@interface TouchButton : UIView {
	int state;
}

@property (nonatomic,assign) IBOutlet id<TouchButtonDelegate> delegate;

- (void)configure;
- (void)touchDown;
- (void)touchUp;

@end
