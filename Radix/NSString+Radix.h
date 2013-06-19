//
//  NSString+Radix.h
//  Radix
//
//  Created by Collin Ruffenach on 3/19/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Radix)

+ (NSArray*)numericalAlphabetWithBase:(NSInteger)base error:(NSError**)error;
+ (NSArray*)binaryAlphabet;
+ (NSArray*)ternaryAlphabet;
+ (NSArray*)decimalAlphabet;
+ (NSArray*)hexAlphabet;

- (NSNumber*)numberWithAlphabet:(NSArray*)alphabet error:(NSError**)error;

@end
