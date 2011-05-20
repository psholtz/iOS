//
//  ControlGroup.h
//  Panel
//
//  Created by Engineer on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TouchButton;

@interface ControlGroup : NSObject {
	NSMutableArray *buttons;
	
	int selected;
}

@property (nonatomic,readonly) int selected; 

- (void)addButton:(TouchButton*)button;

- (void)buttonTapped:(int)position;

@end
