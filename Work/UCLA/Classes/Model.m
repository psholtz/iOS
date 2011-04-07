//
//  Model.m
//  UCLA
//
//  Created by Buyer on 4/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Model.h"


@implementation Model

static NSArray *ANSWERS;

+ (void)initialize
{
	NSArray *_kindOne = [[[NSArray alloc] 
						 initWithObjects:@"A lot more than usual",
						  @"Somewhat more than usual",
						  @"The same\r\nas usual",
						  @"Somewhat less than usual",
						  @"A lot less than usual",nil] retain];
	
	ANSWERS = [[NSArray alloc]
			   initWithObjects:_kindOne,nil];
}

+ (NSString*)getQuestionNumber:(int)number {
	switch ( number ) 
	{
		case 1:
			return @"I've been anxious";
		case 2:
			return @"I've felt energetic";
	}
	return @"";
}

+ (NSArray*)getAnswersNumber:(int)number
{
	return [ANSWERS objectAtIndex:0];
}

@end
