//
//  LabelViewController.m
//  Labels
//
//  Created by Engineer on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LabelViewController.h"


@implementation LabelViewController

static NSString *const kPlaceholder = @"Enter Location";

@synthesize textField0;
@synthesize textField1; 
@synthesize textField2;
@synthesize textField3; 
@synthesize textField4; 

#pragma mark -
#pragma mark Constructor and Object Lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	textField0.placeholder = kPlaceholder;
	textField0.returnKeyType = UIReturnKeyDone;
	textField0.clearButtonMode = UITextFieldViewModeWhileEditing;
	textField0.autocorrectionType = UITextAutocorrectionTypeNo;
	textField0.font = [UIFont fontWithName:@"HeadlineA" size:12.0f];
	
	textField1.placeholder = kPlaceholder;
	textField1.borderStyle = UITextBorderStyleLine;
	textField1.backgroundColor = [UIColor whiteColor];
	textField1.returnKeyType = UIReturnKeyDone;
	textField1.clearButtonMode = UITextFieldViewModeWhileEditing;
	textField1.autocorrectionType = UITextAutocorrectionTypeNo;
	textField1.font = [UIFont fontWithName:@"HiraKakuStdN-W8" size:12.0f];
	
	textField2.placeholder = kPlaceholder;
	textField2.borderStyle = UITextBorderStyleBezel;
	textField2.backgroundColor = [UIColor whiteColor];
	textField2.returnKeyType = UIReturnKeyDone;
	textField2.clearButtonMode = UITextFieldViewModeWhileEditing;
	textField2.autocorrectionType = UITextAutocorrectionTypeNo;
	textField2.font = [UIFont fontWithName:@"pixelmix-bold" size:12.0f];
	
	textField3.placeholder = @"Mercedes-Benz";
	textField3.borderStyle = UITextBorderStyleBezel;
	textField3.backgroundColor = [UIColor whiteColor];
	textField3.returnKeyType = UIReturnKeyDone;
	textField3.clearButtonMode = UITextFieldViewModeWhileEditing;
	textField3.autocorrectionType = UITextAutocorrectionTypeNo;	
	UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mercedes.png"]];
	textField3.leftView = logo;
	textField3.leftViewMode = UITextFieldViewModeAlways;
	[logo release];
	textField3.font = [UIFont fontWithName:@"AdobeHeitiStd-Regular" size:12.0f];
	
	textField4.placeholder = kPlaceholder;
	textField4.clearsOnBeginEditing = FALSE; 
	textField4.borderStyle = UITextBorderStyleNone;
	textField4.background = [UIImage imageNamed:@"enter-location.png"];
	textField4.returnKeyType = UIReturnKeyDone;
	textField4.clearButtonMode = UITextFieldViewModeNever;
	textField4.autocorrectionType = UITextAutocorrectionTypeNo;
	textField4.autocapitalizationType = UITextAutocapitalizationTypeSentences;
	textField4.textColor = [UIColor whiteColor];
	textField4.font = [UIFont fontWithName:@"pixelmix" size:12.0f];
	
	CGRect f = textField4.frame;
	CGRect g = CGRectMake(f.origin.x, f.origin.y, f.size.width, 68);
	textField4.frame = g;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
	self.textField0 = nil;
	self.textField1 = nil;
	self.textField2 = nil;
	self.textField3 = nil; 
	self.textField4 = nil;
}

- (void)dealloc {
	[textField0 release];
	[textField1 release];
	[textField2 release];
	[textField3 release]; 
	[textField4 release];
    [super dealloc];
}

#pragma mark -
#pragma mark UITextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return NO;
}

@end
