//
//  YeMianJiaZaiViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/13.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "YeMianJiaZaiViewController.h"
#import "HCWProgressHUD.h"

@interface YeMianJiaZaiViewController ()

@end

@implementation YeMianJiaZaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_Green;
    HCWProgressHUD *hud = [HCWProgressHUD showHUDAddedTo:self.view animated:YES tapContentBlock:^(HCWProgressHUDMode mode) {
        NSLog(@"*  @param tapContentBlock 点击内容回调");
    } clickButtonBlock:^(HCWProgressHUDMode mode) {
        NSLog(@" *  @param clickButtonBlock 点击按钮回调");
        
    }];
    
    hud.buttonCorlor = [UIColor blueColor];
    
    // 没有网络
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        hud.mode = HCWProgressHUDModeNoInternet;
        NSLog(@"11111111");
        // 没有数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            hud.mode = HCWProgressHUDModeNoData;
            NSLog(@"22222222");
            
            // 隐藏
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"333333");
                
                [HCWProgressHUD hideHUDForView:self.view animated:YES];
            });
        });
    });
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
