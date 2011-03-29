//
//  UIDeviceHardware.h
//
//  Determines the exact hardware platform on which iOS software is running.
//
//  Example usage:
//
//   UIDeviceHardware *h = [[UIDeviceHardware alloc] init];
//   NSLog(@"%@", h.platformString);
//   [h release];
//

#import <Foundation/Foundation.h>


@interface UIDeviceHardware : NSObject 

- (NSString*) platform;
- (NSString*) platformString;

@end
