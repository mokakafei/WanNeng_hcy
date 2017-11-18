//
//  CJNBLWMMViewController.h
//  万能代码封装
//
//  Created by hcy on 2017/9/6.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "CJNBLWMMViewController.h"
#import "HBAlertPasswordView.h"

@interface CJNBLWMMViewController ()
<HBAlertPasswordViewDelegate>

@property (nonatomic, strong) UILabel *passwordLabel;

@end

@implementation CJNBLWMMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 120, 50);
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(passwordAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.center = self.view.center;
    
    // 显示密码的Label
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMinY(button.frame) - 30, self.view.frame.size.width - 40, 21)];
    passwordLabel.text = @"密码显示处";
    passwordLabel.font = [UIFont systemFontOfSize:15];
    passwordLabel.textColor = [UIColor blackColor];
    passwordLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:passwordLabel];
    self.passwordLabel = passwordLabel;
}

- (void)passwordAction {
    // 密码框的View
    HBAlertPasswordView *alertPasswordView = [[HBAlertPasswordView alloc] initWithFrame:self.view.bounds];
    alertPasswordView.delegate = self;
    [self.view addSubview:alertPasswordView];
}

#pragma mark - <HBAlertPasswordViewDelegate>
- (void)sureActionWithAlertPasswordView:(HBAlertPasswordView *)alertPasswordView password:(NSString *)password {
    
    [alertPasswordView removeFromSuperview];
    
    self.passwordLabel.text = [NSString stringWithFormat:@"输入的密码为:%@", password];
}

@end
