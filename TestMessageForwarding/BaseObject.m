//
//  BaseObject.m
//  TestNSProxy
//
//  Created by Bolu on 16/1/7.
//  Copyright © 2016年 Bolu. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSLog(@"BaseObject::methodSignatureForSelector");
    NSLog(@"BaseObject::methodSignatureForSelector::sel::%@",NSStringFromSelector(sel));
    
    NSMethodSignature *sig = [[self class] methodSignatureForSelector:@selector(throwException)];
    
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSLog(@"BaseObject::forwardInvocation");
    NSLog(@"BaseObject::forwardInvocation::invocation selector::%@", NSStringFromSelector([invocation selector]));
    
    [[self class] performSelector:@selector(throwException) withObject:nil];
}

+ (void)throwException
{
    NSLog(@"BaseObject::throwException");
}

@end
