//
//  DetailViewController.h
//  MapDemo
//
//  Created by Engineer on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
	int index;
	UIImageView *backgroundImage; 
}

@property (nonatomic,assign) int index; 
@property (nonatomic,retain) IBOutlet UIImageView *backgroundImage;

- (id)initWithIndex:(int)index;

@end
