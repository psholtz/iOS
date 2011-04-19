//
//  TouchableScrollView.h
//  TouchableScrollView
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
