//
//  DataPickViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/8.
//  Copyright © 2017年 hcy. All rights reserved.
//
#import "UICustomDatePicker.h"
#import "DataPickViewController.h"

@interface DataPickViewController ()

@end

@implementation DataPickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak DataPickViewController *vc = self;
    [UICustomDatePicker showCustomDatePickerAtView:self.view choosedDateBlock:^(NSDate *date) {
        __strong DataPickViewController *ss = vc;
        NSLog(@"current Date:%@",date);
    } cancelBlock:^{
        
    }];

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
