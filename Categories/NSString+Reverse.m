//
//  NSString+Reverse.m
//
//  Example of how to use Categories in Objective-C.
//
//  Example syntax might be something like:
//
//   NSString *one = "test string";
//   NSString *two = [one reverseString];
//   NSLog(@"++ first: %@",one);
//   NSLog(@"++ second: %@",two);
//

#import "NSString+Reverse.h"


@implementation NSString (reverse)

- (NSString*) reverseString
{
	NSMutableString *reversedStr;
	int len = [self length];
	
	// auto released string
	reversedStr = [NSMutableString stringWithCapacity:len];
	
	// quick-and-dirty implementation
	while ( len > 0 )
		[reversedStr appendString:[NSString stringWithFormat:@"%C",[self characterAtIndex:--len]]];
	
	return reversedStr;
}

@end
