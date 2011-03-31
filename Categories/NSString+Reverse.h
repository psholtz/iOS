//
//  NSString+Reverse.h
//
//  Example of how to use Categories in Objective-C.
//
//    NSString *one = "test string";
//    NSString *two = [one reverseString];
//    NSLog(@"++ first: %@",one);
//    NSLog(@"++ second: %@",two);
//

#import <Foundation/Foundation.h>

@interface NSString (reverse)

- (NSString*)reverseString;

@end
