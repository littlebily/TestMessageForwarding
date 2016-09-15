//
//  ViewController.m
//  TestMessageForwarding
//
//  Created by Bolu on 16/1/7.
//  Copyright © 2016年 Bolu. All rights reserved.
//

#import "ViewController.h"
#import "MessageForwarding.h"
#import "SubObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //消息转发
//    MessageForwarding *messageForwarding = [[MessageForwarding alloc] init];
//    [messageForwarding test];
    
    //子类转发消息给父类
    SubObject *subObject = [[SubObject alloc] init];
    [subObject test];
}

@end
