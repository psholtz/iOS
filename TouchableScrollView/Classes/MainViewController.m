//
//  MainViewController.m
//  TouchableScrollView
//
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "TouchableScrollView.h"

@implementation MainViewController

static int kNumOfPages = 5;

@synthesize scrollView;
@synthesize controllers; 
@synthesize currentPage = _currentPage;

#pragma mark -
#pragma mark Constructors and Configuration
- (void)viewDidLoad {
    [super viewDidLoad];
	
	// build an array of detail view controllers to scroll through; 
	NSMutableArray *temp = [[NSMutableArray alloc] init];
	for ( int i=0; i < kNumOfPages; ++i ) {
		[temp addObject:[NSNull null]];
	}
	self.controllers = temp;
	[temp release];
	
	// configure the uiscrollview object;
	scrollView.pagingEnabled = YES;
	scrollView.scrollEnabled = YES;
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.scrollsToTop = NO;
	scrollView.delegate = self;
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumOfPages, scrollView.frame.size.height);
	
	// which page have we currently scrolled to; 
	_currentPage = 0;
	
	[self loadViewController:0];
	[self loadViewController:1];
}

- (void)dealloc {
	[controllers release];
	[scrollView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Scroll Support Methods
- (void)loadViewController:(int)page 
{
	// guard against overflow; 
	if ( page < 0 ) return;
	if ( page >= kNumOfPages ) return; 
	
	// construct view controller if we don't already have one;
	DetailViewController *detail = [self.controllers objectAtIndex:page];
	if ( (NSNull*)detail == [NSNull null] ) {
		detail = [[DetailViewController alloc] initWithPageNumber:page];
		[self.controllers replaceObjectAtIndex:page withObject:detail];
		[detail release];
	}
	
	// configure reference to view controller;
	detail = [self.controllers objectAtIndex:page];
	if ( nil == detail.view.superview ) {
		CGRect frame = scrollView.frame;
		frame.origin.x = frame.size.width * page;
		frame.origin.y = 0;
		detail.view.frame = frame;
		[scrollView addSubview:detail.view];
		
	}
}

#pragma mark -
#pragma mark Scroll Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
	// update current page;
	CGFloat pageWidth = aScrollView.frame.size.width;
	_currentPage = floor((aScrollView.contentOffset.x - pageWidth/2) / pageWidth) + 1;
	
	// load controllers, if needed
	[self loadViewController:(self.currentPage - 1)];
	[self loadViewController:(self.currentPage)];
	[self loadViewController:(self.currentPage + 1)];
}

@end
