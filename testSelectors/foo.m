//
//  foo.m
//  testSelectors
//
//  Created by Ollie Edwards on 23/02/2015.
//  Copyright (c) 2015 mobbu. All rights reserved.
//

#import "foo.h"

@implementation foo

- (void) go {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didBarWithSpam:)]) {
        [self.delegate didBarWithSpam:@"SPAM"];
    }
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didBarWithSpam:andEggs:)]) {
        [self.delegate didBarWithSpam:@"SPAM" andEggs:@"EGGS"];
    }
}

@end
