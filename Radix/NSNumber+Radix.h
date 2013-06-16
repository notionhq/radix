//
//  NSNumber+Radix.h
//  Radix
//
//  Created by Collin Ruffenach on 3/18/13.
//  Copyright (c) 2013 Notion HQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Radix)

- (NSString*)NSStringForBaseWithAlphabet:(NSArray*)alphabet;

@end
