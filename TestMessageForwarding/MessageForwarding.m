//
//  MessageForwarding.m
//  TestNSProxy
//
//  Created by Bolu on 16/1/7.
//  Copyright © 2016年 Bolu. All rights reserved.
//

#import "MessageForwarding.h"
#import "Test.h"

/*
 “消息转发”（message forwarding）机制
 1.使用methodSignatureForSelector与forwardInvocation实现消息转发
 2.在给程序添加消息转发功能以前，必须覆盖两个方法，即methodSignatureForSelector:和forwardInvocation:。
 3.methodSignatureForSelector:的作用在于为另一个类实现的消息创建一个有效的方法签名，必须实现，并且返回不为空的
 NSMethodSignature，否则会crash。
 forwardInvocation:将选择器转发给一个真正实现了该消息的对象。
 */

@interface MessageForwarding ()
{
    Test *_test;
}

@end

@implementation MessageForwarding

//待深究NSMethodSignature类与NSInvocation类，[NSMethodSignature signatureWithObjCTypes:"v@:@"]返回有对象，有添加书签

- (instancetype)init
{
    _test = [[Test alloc] init];
    
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSLog(@"MessageForwarding::methodSignatureForSelector");
    NSLog(@"MessageForwarding::methodSignatureForSelector::sel::%@",NSStringFromSelector(sel));
    
    //判断消息转发到_test对象是否能接受，sig为nil则不会调用forwardInvocation方法，然后崩溃，否则就会调forwardInvocation
    NSMethodSignature *sig = [_test methodSignatureForSelector:sel];
//    sig = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    
    if (!sig)
    {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];//返回一个不为空的NSMethodSignature
    }
    
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSLog(@"MessageForwarding::forwardInvocation");
    NSLog(@"MessageForwarding::forwardInvocation::invocation selector::%@", NSStringFromSelector([invocation selector]));
    
    if ([_test respondsToSelector:[invocation selector]])
    {
        [_test performSelectorInBackground:@selector(test) withObject:nil];
    }
}

@end
