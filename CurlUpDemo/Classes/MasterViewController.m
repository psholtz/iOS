//
//  MasterViewController.m
//  CurlUpDemo
//

#import "MasterViewController.h"

@implementation MasterViewController

@synthesize container;
@synthesize child;
@synthesize info;

@synthesize error1;
@synthesize error2;

@synthesize removeButton;
@synthesize replaceButton;

@synthesize slider;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        count = 0;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
 
	// adjust the frame height (tab controllers seem to mess this up)
	CGRect f = self.container.frame;
	self.container.frame = CGRectMake(f.origin.x, f.origin.y, f.size.width, 250.);
 
	// add the child frame;
	float tabFactor = (480. - 94.)/480.;	 //?? is the UITabBarItem xx pixels high? 
	self.child = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.container.frame.size.width, tabFactor * self.container.frame.size.height)];
	self.child.backgroundColor = [UIColor yellowColor];
	[self.container addSubview:self.child];
 
	error1 = [[UIAlertView alloc] initWithTitle:@"Cover Removed!" message:@"Please press Reset to\r\ndemo the app again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	error2 = [[UIAlertView alloc] initWithTitle:@"Cover Ready!" message:@"Please press Remove\r\nto demo the app." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
 
	slider.enabled = NO;
	
	[self updateUIReplace];
}

#pragma mark -
#pragma mark IBAction methodsb
- (IBAction)remove:(id)sender
{
	NSLog(@"++ defer to child class");
}

- (IBAction)replace:(id)sender 
{
	NSLog(@"++ defer to child class");
}

#pragma mark -
#pragma mark UIControls
- (void)updateUIRemove
{
	removeButton.enabled = FALSE;
	removeButton.alpha = ALPHA_OFF;
	replaceButton.enabled = TRUE; 
	replaceButton.alpha	= ALPHA_ON;
	
	count++;
}

- (void)updateUIReplace 
{
	removeButton.enabled = TRUE;
	removeButton.alpha = ALPHA_ON;
	replaceButton.enabled = FALSE;
	replaceButton.alpha = ALPHA_OFF;
	
	count = 0;
}

#pragma mark -
#pragma mark Memory Management
- (void)dealloc {
	[slider release];
	
	[removeButton release];
	[replaceButton release];
	
	[error1 release];
	[error2 release];
	
	[container release];
	[child release];
	[info release];
	
    [super dealloc];
}

@end
