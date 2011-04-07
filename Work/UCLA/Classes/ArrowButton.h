//
//  ArrowButton.h
//  UCLA
//
//  Created by Buyer on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ACTIVE_ALPHA_ACTIVE			1.0f
#define ACTIVE_ALPHA_INACTIVE		0.45f
#define ACTIVE_DEFAULT_DURATION		0.3f

enum { ACTIVE_KIND_LEFT, ACTIVE_KIND_RIGHT };

@protocol ArrowButtonDelegate

- (void) moveLeft;
- (void) moveRight;

@end

@interface ArrowButton : UIView {
	BOOL _active;
	float _duration;
	int _kind;
	
	id<ArrowButtonDelegate> delegate;
}

@property (nonatomic,assign) BOOL active;
@property (nonatomic,assign) float duration;
@property (nonatomic,assign) int kind; 
@property (nonatomic,retain) id<ArrowButtonDelegate> delegate;

@end
