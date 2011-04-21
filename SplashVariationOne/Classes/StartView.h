//
//  StartView.h
//  SplashTransition
//
//  Created by Engineer on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StartView : UIView {
	UILabel *info;
}

@property (nonatomic,retain) UILabel *info; 

- (void)configure;

@end
