//
//  NSString+Radix.m
//  Radix
//
//  Created by Collin Ruffenach on 3/19/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import "NSString+Radix.h"

@implementation NSString (Radix)

- (NSNumber*)numberWithAlphabet:(NSArray*)alphabet error:(NSError**)error {
    NSInteger value = 0;
    NSInteger base = alphabet.count;
    for (int i = alphabet.count-1; i >=0; i--) {
        NSInteger digitIndex = alphabet.count-1-i;
        NSString *string = [self substringWithRange:NSMakeRange(i, 1)];
        NSInteger index = [alphabet indexOfObject:string];
        if (index == NSNotFound) {
            *error = [NSError errorWithDomain:@"com.notionhq.NSString+Radix" code:0 userInfo:@{@"description":[NSString stringWithFormat:@"%@ was not found in the provided alphabet", string]}];
            return nil;
        }
        value += index*pow(base,digitIndex);
    }
    return @(value);
}

@end
