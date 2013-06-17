//
//  RDXKeyboard.m
//  Radix
//
//  Created by Collin Ruffenach on 3/19/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import "RDXKeyboard.h"

@interface RDXKeyboardKey : UIControl

@property (nonatomic, retain) NSString *string;

@end

@implementation RDXKeyboardKey

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIColor grayColor] setFill];
    UIRectFill(rect);
    UIFont *font = [UIFont systemFontOfSize:18];
    NSDictionary *attributes = @{NSFontAttributeName: font};
    CGSize stringSize = [self.string sizeWithAttributes:attributes];
    [[UIColor whiteColor] setFill];
    [self.string drawInRect:CGRectMake(floorf((CGRectGetWidth(rect)-stringSize.width)/2.0),
                                       floorf((CGRectGetHeight(rect)-stringSize.height)/2.0),
                                       stringSize.width,
                                       stringSize.height)
             withAttributes:attributes];
}

- (void)setString:(NSString *)string {
    _string = string;
    [self setNeedsDisplay];
}

@end

@interface RDXKeyboard ()

@property (nonatomic, strong) NSArray *keys;

@end

#define kRDXKeysPerRow      5
#define kRDXKeyWidth        320.0/kRDXKeysPerRow
#define kRDXKeyHeight       kRDXKeyWidth
#define kRDXKeySize         CGSizeMake(kRDXKeyWidth,kRDXKeyHeight)

#define kRDXKeyTagOffset    1024

CGRect frameForKeyAtIndex(NSInteger index) {
    return CGRectMake(index%kRDXKeysPerRow*kRDXKeyWidth,
                      floorf(index/kRDXKeysPerRow)*kRDXKeyHeight,
                      kRDXKeyWidth,
                      kRDXKeyHeight);
}

@implementation RDXKeyboard

+ (RDXKeyboard *)keyboard {
    static dispatch_once_t once;
    static RDXKeyboard *keyboard;
    dispatch_once(&once, ^ { keyboard = [[RDXKeyboard alloc] init]; });
    return keyboard;
}

- (RDXKeyboardKey*)keyForIndex:(NSInteger)index {
    RDXKeyboardKey *key = nil;
    if (index < self.alphabet.count) {
        key = (RDXKeyboardKey*)[self viewWithTag:kRDXKeyTagOffset+index];
    }
    return key;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (int i = 0; i < self.alphabet.count; i++) {
        RDXKeyboardKey *key = [self keyForIndex:i];
        if (!key) {
            key = [[RDXKeyboardKey alloc] initWithFrame:CGRectZero];
            key.tag = kRDXKeyTagOffset+i;
            [self addSubview:key];
        }
        key.frame = frameForKeyAtIndex(i);
        key.string = [self.alphabet objectAtIndex:i];
    }
    
    self.contentSize = CGSizeMake(320, (ceilf(self.alphabet.count/kRDXKeysPerRow)+1)*kRDXKeyHeight);
}

- (void)setAlphabet:(NSArray *)alphabet {
    _alphabet = alphabet;
    [self setNeedsLayout];
}

@end
