//
//  TouchableScrollView.m
//  TouchableScrollView
//

#import "TouchableScrollView.h"
#import "GuardedView.h"

@interface TouchableScrollView (Protected)

- (void)configure;

@end

@implementation TouchableScrollView

@synthesize allowScrolling = _allowScrolling;
@synthesize guards; 

#pragma mark -
#pragma mark Constructors and Configuration
- (id) initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if ( self ) {
		[self configure];
	}
	return self; 
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if ( self ) {
		[self configure];
	}
	return self;
}

- (void)configure
{
	guards = [[NSMutableArray alloc] init];
	
	_allowScrolling = TRUE;
}

- (void)dealloc 
{
	[guards release];
	[super dealloc];
}

#pragma mark -
#pragma mark State Management
- (void)addGuardedView:(GuardedView *)guard
{
	[guards addObject:guard];
}

#pragma mark -
#pragma mark Gesture and Event Management
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
	// do the calculation, but only if we have the guard; 
	if ( self.guards.count > 0 ) {
		CGPoint p;
		for ( GuardedView *guard in self.guards ) {
			p = [gestureRecognizer locationInView:guard];
			if ( p.x >= 0 && p.x <= guard.width && p.y >= 0 && p.y <= guard.height && guard.active ) {
				_allowScrolling = NO; 
				return self.allowScrolling;
			}
		}
	}
	
	// default case;
	_allowScrolling = YES;
	return self.allowScrolling;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	// do the calculation, but only if we have the guard
	if ( self.guards.count > 0 ) { 
		CGPoint p;
		UITouch *touch = [touches anyObject];		
		for ( GuardedView *guard in self.guards ) {
			p = [touch locationInView:guard];
			if ( p.x >= 0 && p.x <= guard.width && p.y >= 0 && p.y <= guard.height && guard.active ) {
				_allowScrolling = NO;
				return;
			}
		}
	}
	
	// default case;
	_allowScrolling = YES;
}

@end
