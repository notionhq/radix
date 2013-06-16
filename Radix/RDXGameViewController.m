//
//  RDXGameViewController.m
//  Radix
//
//  Created by Collin Ruffenach on 3/19/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import "RDXGameViewController.h"
#import "RDXKeyboard.h"

@interface RDXGameViewController ()

@property (nonatomic, strong) RDXKeyboard *keyboard;

@end

@implementation RDXGameViewController

- (id)init {
    self = [super init];
    if (self) {
        RDXKeyboard *keyboard = [RDXKeyboard keyboard];
        keyboard.alphabet = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
        [self.view addSubview:keyboard];
        self.keyboard = keyboard;
    }
    return self;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.keyboard.frame = CGRectMake(0,
                                     CGRectGetHeight(self.view.bounds)-kRDXKeyboardHeight,
                                     CGRectGetWidth(self.view.bounds),
                                        kRDXKeyboardHeight);
}

@end
