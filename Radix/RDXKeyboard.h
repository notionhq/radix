//
//  RDXKeyboard.h
//  Radix
//
//  Created by Collin Ruffenach on 3/19/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kRDXKeyboardHeight 217

@interface RDXKeyboard : UIScrollView

+ (RDXKeyboard*)keyboard;

@property (nonatomic, strong) NSArray *alphabet;

@end
