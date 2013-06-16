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
    STAssertTrue([[@(2) NSStringForBaseWithAlphabet:(@[@"0", @"1"])] isEqualToString:@"10"], [NSString stringWithFormat:@"2 in base 2 should be \"10\" but instead was %@", [@(2) NSStringForBaseWithAlphabet:(@[@"0", @"1"])]]);
}

- (void)test10InDecimalIs110InBinary {
    STAssertTrue([[@(10) NSStringForBaseWithAlphabet:(@[@"0", @"1"])] isEqualToString:@"1010"], [NSString stringWithFormat:@"10 in base 2 should be \"1010\" instead was %@", [@(10) NSStringForBaseWithAlphabet:(@[@"0", @"1"])]]);
}

- (void)test2InDecimalIs2InTrinary {
    STAssertTrue([[@(2) NSStringForBaseWithAlphabet:(@[@"0", @"1", @"2"])] isEqualToString:@"2"], [NSString stringWithFormat:@"2 in base 3 should be \"2\" but instead was %@", [@(2) NSStringForBaseWithAlphabet:(@[@"0", @"1", @"2"])]]);
}

- (void)test10InDecimalIs101InTrinary {
    STAssertTrue([[@(10) NSStringForBaseWithAlphabet:(@[@"0", @"1", @"2"])] isEqualToString:@"101"], [NSString stringWithFormat:@"10 in base 3 should be \"101\" instead was %@", [@(10) NSStringForBaseWithAlphabet:(@[@"0", @"1", @"2"])]]);
}

- (void)testString10InBinaryIs2 {
    NSError *error = nil;
    STAssertTrue([[@"10" numberWithAlphabet:(@[@"0", @"1"]) error:&error] isEqual:@(2)], @"\"10\" in binary should be 2 instead was %@", [@"10" numberWithAlphabet:(@[@"0", @"1"]) error:&error]);
    STAssertNil(error, @"Error not nil when it should be");
}

- (void)testString101InTrinaryIs10 {
    NSError *error = nil;
    STAssertTrue([[@"101" numberWithAlphabet:(@[@"0", @"1", @"2"]) error:&error] isEqual:@(10)], @"\"101\" in binary should be 10 instead was %@", [@"101" numberWithAlphabet:(@[@"0", @"1", @"2"]) error:&error]);
    STAssertNil(error, @"Error not nil when it should be");
}

- (void)testErrorForInvalidAlphabet {
    NSError *error = nil;
    STAssertNil([@"10" numberWithAlphabet:(@[@"0"]) error:&error], @"\"10\" in radix with alphabet @[@\"0\"] should be nil instead was %@", [@"10" numberWithAlphabet:(@[@"0"]) error:&error]);
    STAssertNotNil(error, @"Error is not nil when it should be");
}

@end