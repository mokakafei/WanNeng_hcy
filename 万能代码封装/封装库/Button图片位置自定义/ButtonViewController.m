//
//  ButtonViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/7.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "ButtonViewController.h"
#import "UIButton+HQCustomIcon.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB_White;
    [self customIconButton];

}
- (void)customIconButton {
    CGFloat btn_width = 200;
    CGFloat btn_heigth = 70;
    CGFloat margin = 50;
    
    for (int i = 0; i < 4; i ++) {
        //创建button
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        [self.view addSubview:button];
        button.frame = CGRectMake((self.view.bounds.size.width - btn_width) / 2, i * (btn_heigth + margin) + 70, btn_width, btn_heigth);
        if (i == 0) {
            [button setTitle:@"图片在左" forState:UIControlStateNormal];
            [button setIconInLeftWithSpacing:5];
        }else if (i == 1) {
            [button setTitle:@"图片在右" forState:UIControlStateNormal];
            [button setIconInRightWithSpacing:5];
        }else if (i == 2) {
            [button setTitle:@"图片在上" forState:UIControlStateNormal];
            [button setIconInTopWithSpacing:5];
        }else {
            [button setTitle:@"图片在下" forState:UIControlStateNormal];
            [button setIconInBottomWithSpacing:5];
        }
        
    }
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
