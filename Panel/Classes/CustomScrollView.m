//
//  CustomScrollView.m
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomScrollView.h"

@implementation CustomScrollView

@synthesize movingLeft;
@synthesize movingRight;

@synthesize isScrolling;

- (void)scrollToLeft {
	movingLeft = TRUE; 
	
	[self scrollRectToVisible:CGRectMake(2 * 320,0,320,480) animated:YES];
}

- (void)postAdjustForLeft {
	CGRect slot1 = CGRectMake(0, 0, 320, 480);
	CGRect slot2 = CGRectMake(320, 0, 320, 480);
	for ( UIView *v in self.subviews ) { 
		if ( v.frame.origin.x == 320 ) {
			v.frame = slot1;
		}
		else if ( v.frame.origin.x == 2 * 320 ) {
			v.frame = slot2;
		}
	}
	
	[self scrollRectToVisible:CGRectMake(320, 0, 320, 480) animated:NO];
	
	isScrolling = FALSE; 
	movingLeft = FALSE;
}

- (void)scrollToRight {
	movingRight = TRUE; 
	
	[self scrollRectToVisible:CGRectMake(0,0,320,480) animated:YES];
}

- (void)postAdjustForRight {
	CGRect slot1 = CGRectMake(320, 0, 320, 480);
	CGRect slot2 = CGRectMake(2 * 320, 0, 320, 480);
	for ( UIView *v in self.subviews ) { 
		if ( v.frame.origin.x == 320 ) {
			v.frame = slot2;
		}
		else if ( v.frame.origin.x == 0 ) {
			v.frame = slot1;
		}
	}
	
	[self scrollRectToVisible:CGRectMake(320, 0, 320, 480) animated:NO];
	
	isScrolling = FALSE;
	movingRight = FALSE;
}

/**
 * Remove the subviews at these positions;
 *
 * Position may be 0, 1, 2 
 */
- (void)removeSubviewsAtPosition:(int)position {
	for ( UIView *v in self.subviews ) {
		if ( v.frame.origin.x == position * 320 ) {
			[v removeFromSuperview];
		}
	}
}

@end
