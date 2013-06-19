//
//  RadixTests.m
//  RadixTests
//
//  Created by Collin Ruffenach on 3/18/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import "RadixTests.h"
#import "NSNumber+Radix.h"
#import "NSString+Radix.h"

@implementation RadixTests

- (void)test2InDecimalIs10InBinary {
    NSArray *binaryAlphabet = [NSString binaryAlphabet];
    STAssertTrue([[@(2) NSStringForBaseWithAlphabet:binaryAlphabet] isEqualToString:@"10"], [NSString stringWithFormat:@"2 in base 2 should be \"10\" but instead was %@", [@(2) NSStringForBaseWithAlphabet:binaryAlphabet]]);
}

- (void)test10InDecimalIs110InBinary {
    NSArray *binaryAlphabet = [NSString binaryAlphabet];
    STAssertTrue([[@(10) NSStringForBaseWithAlphabet:binaryAlphabet] isEqualToString:@"1010"], [NSString stringWithFormat:@"10 in base 2 should be \"1010\" instead was %@", [@(10) NSStringForBaseWithAlphabet:binaryAlphabet]]);
}

- (void)test2InDecimalIs2InTernary {
    NSArray *ternaryAlphabet = [NSString ternaryAlphabet];
    STAssertTrue([[@(2) NSStringForBaseWithAlphabet:ternaryAlphabet] isEqualToString:@"2"], [NSString stringWithFormat:@"2 in base 3 should be \"2\" but instead was %@", [@(2) NSStringForBaseWithAlphabet:ternaryAlphabet]]);
}

- (void)test10InDecimalIs101InTrinary {
    NSArray *ternaryAlphabet = [NSString ternaryAlphabet];
    STAssertTrue([[@(10) NSStringForBaseWithAlphabet:ternaryAlphabet] isEqualToString:@"101"], [NSString stringWithFormat:@"10 in base 3 should be \"101\" instead was %@", [@(10) NSStringForBaseWithAlphabet:ternaryAlphabet]]);
}

- (void)testString10InBinaryIs2 {
    NSError *error = nil;
    NSArray *binaryAlphabet = [NSString binaryAlphabet];
    STAssertTrue([[@"10" numberWithAlphabet:binaryAlphabet error:&error] isEqual:@(2)], @"\"10\" in binary should be 2 instead was %@", [@"10" numberWithAlphabet:binaryAlphabet error:&error]);
    STAssertNil(error, @"Error not nil when it should be");
}

- (void)testString101InTrinaryIs10 {
    NSError *error = nil;
    NSArray *ternaryAlphabet = [NSString ternaryAlphabet];
    STAssertTrue([[@"101" numberWithAlphabet:ternaryAlphabet error:&error] isEqual:@(10)], @"\"101\" in binary should be 10 instead was %@", [@"101" numberWithAlphabet:ternaryAlphabet error:&error]);
    STAssertNil(error, @"Error not nil when it should be");
}

- (void)testStringABCInHexIs2748 {
    NSError *error = nil;
    NSArray *hexAlphabet = [NSString hexAlphabet];
    STAssertTrue([[@"ABC" numberWithAlphabet:hexAlphabet error:&error] isEqual:@(2748)], @"\"ABC\" in hex should be 2748 instead was %@", [@"ABC" numberWithAlphabet:hexAlphabet error:&error]);
    STAssertNil(error, @"Error not nil when it should be");
}

- (void)testErrorForInvalidAlphabet {
    NSError *error = nil;
    STAssertNil([@"10" numberWithAlphabet:(@[@"0"]) error:&error], @"\"10\" in radix with alphabet @[@\"0\"] should be nil instead was %@", [@"10" numberWithAlphabet:(@[@"0"]) error:&error]);
    STAssertNotNil(error, @"Error is not nil when it should be");
}

@end