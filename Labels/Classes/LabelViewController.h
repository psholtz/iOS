//
//  LabelViewController.h
//  Labels
//
//  Created by Engineer on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LabelViewController : UIViewController {
	UITextField *textField0;
	UITextField *textField1;
	UITextField	*textField2; 
	UITextField *textField3; 
	UITextField *textField4;
}

@property (nonatomic,retain) IBOutlet UITextField *textField0;
@property (nonatomic,retain) IBOutlet UITextField *textField1; 
@property (nonatomic,retain) IBOutlet UITextField *textField2;
@property (nonatomic,retain) IBOutlet UITextField *textField3;
@property (nonatomic,retain) IBOutlet UITextField *textField4;

@end
