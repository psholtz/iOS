//
//  GuardedView.m
//  TouchableScrollView
//
//

#import "GuardedView.h"

@interface GuardedView (Protected)

- (void)configure;

@end

@implementation GuardedView

@synthesize active;

- (float) width		{ return self.frame.size.width; }
- (float) height	{ return self.frame.size.height; }

#pragma mark -
#pragma mark Constructors and Configuration
- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if ( self ) {
		[self configure];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder 
{
	self = [super initWithCoder:aDecoder];
	if ( self ) {
		[self configure];
	}
	return self;
}

- (void)configure
{
	active = TRUE;
}

@end
