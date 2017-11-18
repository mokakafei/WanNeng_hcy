//
//  AlertTableViewController.m
//  LEEAlertDemo
//
//  Created by 李响 on 2017/5/18.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "AlertTableViewController.h"

#import "LEEAlert.h"


@interface AlertTableViewController ()


@end

@implementation AlertTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.title = @"Alert";
    
    UIButton *button = [UIButton buttonWithType:0];
    button.backgroundColor = [UIColor yellowColor];
    button.frame = CGRectMake(100, 100, 50, 50);
    [button addTarget:self action:@selector(base) forControlEvents:UIControlEventTouchUpInside];
 
    [self.view addSubview:button];
}


#pragma mark - 基础

- (void)base{
    
            [LEEAlert alert].config
            .LeeTitle(@"标题")
            .LeeContent(@"内容")
            .LeeCancelAction(@"取消", ^{
                XMGLog(@"取消取消取消取消");
                // 取消点击事件Block
            })
            .LeeAction(@"确认", ^{
                XMGLog(@"确认确认确认确认确认确认确认");

                // 确认点击事件Block
            })
            .LeeShow(); // 设置完成后 别忘记调用Show来显示
    
}


@end
