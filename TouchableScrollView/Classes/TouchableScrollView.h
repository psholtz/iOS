//
//  TouchableScrollView.h
//  TouchableScrollView
//
//  Created by Engineer on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GuardedView;

@interface TouchableScrollView : UIScrollView {
	BOOL _allowScrolling;
	
	NSMutableArray *guards; 
}

@property (nonatomic,readonly) BOOL allowScrolling;  
@property (nonatomic,retain) NSMutableArray *guards; 

- (void)addGuardedView:(GuardedView*)guard;

@end
