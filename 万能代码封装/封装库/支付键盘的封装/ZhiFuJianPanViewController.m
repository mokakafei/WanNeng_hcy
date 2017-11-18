//
//  ZhiFuJianPanViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/19.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "ZhiFuJianPanViewController.h"
#import "keyview.h"

@interface ZhiFuJianPanViewController ()

@end

@implementation ZhiFuJianPanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付键盘的封装";
    self.view.backgroundColor = RGB_White;
    // Do any additional setup after loading the view.
    keyview   *key=[[keyview   alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height) addButtonAction:^(NSString *sender) {
        NSLog(@"%@",sender);
    }];
    [self.view  addSubview:key];

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
