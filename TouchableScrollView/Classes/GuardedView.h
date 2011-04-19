//
//  GuardedView.h
//  TouchableScrollView
//

#import <Foundation/Foundation.h>


@interface GuardedView : UIView {
	BOOL active;
}

@property (nonatomic,assign) BOOL active; 

@property (nonatomic,readonly) float width;
@property (nonatomic,readonly) float height; 

@end
