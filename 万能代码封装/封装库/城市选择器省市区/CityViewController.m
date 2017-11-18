//
//  CityViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/10.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "CityViewController.h"
#import "FYLCityPickView.h"

@interface CityViewController ()

@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
     
     1.FYLCityPickView.m 中 给model 赋值用到了YYModel
     2.FYLCityPickView 每次显示都会滚动到相应的数据,若不想每次都滚动,可自己改为单例
     3.
     
     */
//    __weak CityViewController *weskSelf = self;
    [FYLCityPickView showPickViewWithComplete:^(NSArray *arr) {
//        weskSelf.labelCity.text = [NSString stringWithFormat:@"%@-%@-%@",arr[0],arr[1],arr[2]];
        NSString *stinrg = [NSString stringWithFormat:@"%@-%@-%@",arr[0],arr[1],arr[2]];
        XMGLog(@"选择的城市是: -----: %@", stinrg);
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
