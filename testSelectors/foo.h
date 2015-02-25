//
//  foo.h
//  testSelectors
//
//  Created by Ollie Edwards on 23/02/2015.
//  Copyright (c) 2015 mobbu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol fooProtocol<NSObject>
- (void) didBarWithSpam: (NSString*)spam;
- (void) didBarWithSpam: (NSString*)spam andEggs: (NSString*)eggs;
- (void) didBarWithSpam: (NSString*)spam AndSausages: (NSString*)sausages;
@end

@interface foo : NSObject
@property id<fooProtocol> delegate;
-(void) barWithSpam;
-(void) barWithSpamAndEggs;
-(void) barWithSpamAndSausages;
@end
