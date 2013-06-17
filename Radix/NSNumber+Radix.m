//
//  NSNumber+Radix.m
//  Radix
//
//  Created by Collin Ruffenach on 3/18/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import "NSNumber+Radix.h"

@implementation NSNumber (Radix)

- (NSString*)NSStringForBaseWithAlphabet:(NSArray*)alphabet {
    NSMutableString *result = [NSMutableString string];
    NSInteger targetBase = alphabet.count;
    NSInteger value = self.integerValue;
    do {
        result = [NSMutableString stringWithFormat:@"%@%@", alphabet[value % targetBase], result];
        value = value / targetBase;
    } while (value > 0);
    return [NSString stringWithString:result];
}

@end
