//
//  CustomScrollView.h
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomScrollView : UIScrollView {
	BOOL movingLeft;
	BOOL movingRight;
	
	BOOL isScrolling; 
}

@property (nonatomic,readonly) BOOL movingLeft;
@property (nonatomic,readonly) BOOL movingRight;

@property (nonatomic,assign) BOOL isScrolling;

- (void)scrollToLeft;
- (void)scrollToRight;

- (void)postAdjustForLeft;
- (void)postAdjustForRight;

- (void)removeSubviewsAtPosition:(int)position;

@end
