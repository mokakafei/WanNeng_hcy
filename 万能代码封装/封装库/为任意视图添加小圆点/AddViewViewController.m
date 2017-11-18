//
//  AddViewViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/7.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "AddViewViewController.h"
#import "UIView+Badge.h"

@interface AddViewViewController ()

@end

@implementation AddViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *blueView=[[UIView alloc] init];
    
    [blueView setFrame:CGRectMake(40, 70, 200, 20)];
    [blueView  yee_MakeBadgeText:@"" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:10]];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    UIView *grayView=[[UIView alloc] init];
    
    [grayView setFrame:CGRectMake(40, 120, 200, 20)];
    [grayView  yee_MakeBadgeText:@"100" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:10]];
    [grayView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:grayView];
    
    
    UIButton *buttonView=[UIButton buttonWithType:UIButtonTypeCustom];
    [buttonView setFrame:CGRectMake(40, 180, 50, 40)];
    [buttonView setImage:[UIImage imageNamed:@"artical_detail_icon_comment_disabled"] forState:UIControlStateNormal];
    [buttonView  yee_MakeBadgeText:@"2345" textColor:[UIColor whiteColor] backColor:[UIColor redColor] Font:[UIFont systemFontOfSize:9]];
    [buttonView addTarget:self action:@selector(ghide:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonView];
    
}


-(void)ghide:(UIButton *)button{
    [button removeBadgeView];
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
