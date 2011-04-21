//
//  LoadingView.h
//  SplashTransition
//
//  Created by Engineer on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoadingView : UIView {
	UILabel *info; 
	UIActivityIndicatorView *spinner; 
}

@property (nonatomic,retain) UILabel *info; 
@property (nonatomic,retain) UIActivityIndicatorView *spinner; 

- (void)configure;

@end
