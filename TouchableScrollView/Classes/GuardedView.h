//
//  GuardedView.h
//  TouchableScrollView
//
//  Created by Engineer on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GuardedView : UIView {
	BOOL active;
}

@property (nonatomic,assign) BOOL active; 

@property (nonatomic,readonly) float width;
@property (nonatomic,readonly) float height; 

@end
