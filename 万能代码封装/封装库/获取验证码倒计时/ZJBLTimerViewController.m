//
//  ZJBLTimerViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/10.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "ZJBLTimerViewController.h"
#import "ZJBLTimerButton.h"

@interface ZJBLTimerViewController ()

@end

@implementation ZJBLTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //时间按钮
    ZJBLTimerButton *TimerBtn = [[ZJBLTimerButton alloc] initWithFrame:CGRectMake(100, 100, 150, 50)];
    __weak typeof(self) WeakSelf = self;
    TimerBtn.countDownButtonBlock = ^{
        [WeakSelf qurestCode]; //开始获取验证码
    };
    [self.view addSubview:TimerBtn];
}
//发生网络请求 --> 获取验证码
- (void)qurestCode {
    
    NSLog(@"发生网络请求 --> 获取验证码");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
