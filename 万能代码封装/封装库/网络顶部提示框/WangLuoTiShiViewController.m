//
//  WangLuoTiShiViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/10.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "WangLuoTiShiViewController.h"
#import "Nonetwork.h"

@interface WangLuoTiShiViewController ()

@end

@implementation WangLuoTiShiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB_White;
    Nonetwork *Nonet=[[Nonetwork alloc] initWithFrame:[UIScreen mainScreen].bounds];
    Nonet.Prompt=@"无法连接服务器，请检查你的网络设置";
    Nonet.typeDisappear=1;
    [Nonet popupWarningview];
    Nonet.returnsAnEventBlock = ^{
        NSLog(@"重新加载数据");
    };
    [self.view addSubview:Nonet];

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
