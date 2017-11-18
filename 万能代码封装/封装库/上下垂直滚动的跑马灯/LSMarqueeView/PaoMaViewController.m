//
//  PaoMaViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/7.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "PaoMaViewController.h"
#import "LSMarqueeView.h"
@interface PaoMaViewController ()
@property (nonatomic, strong) LSMarqueeView *marqueeView;

@end

@implementation PaoMaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    // >>>>>> dataSorce >>>>>
    NSMutableArray *tempArr = @[].mutableCopy;
    UILabel *labelOne = [UILabel new];
    labelOne.font = [UIFont systemFontOfSize:14];
    labelOne.text = @"☺ 这是一个广告标题1~~";
    labelOne.textColor = [UIColor blackColor];
    
    UILabel *labelTwo = [UILabel new];
    labelTwo.font = [UIFont systemFontOfSize:14];
    labelTwo.text = @"☺ 这是一个广告标题2~~";
    labelTwo.textColor = [UIColor blackColor];
    
    UILabel *labelThree = [UILabel new];
    labelThree.font = [UIFont systemFontOfSize:14];
    labelThree.text = @"☺ 这是一个广告标题3~~";
    labelThree.textColor = [UIColor blackColor];
    
    [tempArr addObject:labelOne];
    [tempArr addObject:labelTwo];
    [tempArr addObject:labelThree];
    // >>>>>> dataSorce >>>>>
    
    self.marqueeView = [[LSMarqueeView alloc] initWithFrame:CGRectMake(10, 100, 354, 60)];
    self.marqueeView.lsLabelArr = tempArr;
    [self.marqueeView beginShowAdd];
    [self.view addSubview:self.marqueeView];
    
    self.marqueeView.clickBlock = ^(id sender){
        NSLog(@"sender %@", sender);
    };
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
