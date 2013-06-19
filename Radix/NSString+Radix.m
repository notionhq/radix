//
//  NSString+Radix.m
//  Radix
//
//  Created by Collin Ruffenach on 3/19/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import "NSString+Radix.h"

@implementation NSString (Radix)

+ (NSArray*)numericalAlphabetWithBase:(NSInteger)base error:(NSError**)error {
    if (base < 1 || base > 10) {
        if (error && error != NULL) {
            *error = [NSError errorWithDomain:@"com.notionhq.NSString+Radix" code:0 userInfo:@{@"description":[NSString stringWithFormat:@"%@ was provided as a base but should be between 1 and 10", @(base)]}];
        }
        return nil;
    }
    
    NSMutableArray *alphabet = [NSMutableArray array];
    for (int i = 0; i < base; i++) {
        [alphabet addObject:[@(i) description]];
    }
    return [NSArray arrayWithArray:alphabet];
}

+ (NSArray*)binaryAlphabet {
    return [self numericalAlphabetWithBase:2 error:nil];
}

+ (NSArray*)ternaryAlphabet {
    return [self numericalAlphabetWithBase:3 error:nil];
}

+ (NSArray*)decimalAlphabet {
    return [self numericalAlphabetWithBase:10 error:nil];
}

+ (NSArray*)hexAlphabet {
    return @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"A", @"B", @"C", @"D", @"E", @"F"];
}

- (NSNumber*)numberWithAlphabet:(NSArray*)alphabet error:(NSError**)error {
    NSInteger value = 0;
    NSInteger base = alphabet.count;
    for (int i = self.length-1; i >=0; i--) {
        NSInteger digitIndex = self.length-1-i;
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
