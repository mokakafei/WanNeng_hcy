//
//  RiLiController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/7.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "RiLiController.h"
#import "YXCalendarView.h"

@interface RiLiController ()
@property (nonatomic, strong) YXCalendarView *calendar;

@end

@implementation RiLiController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"日历";
    _calendar = [[YXCalendarView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [YXCalendarView getMonthTotalHeight:[NSDate date] type:CalendarType_Month]) Date:[NSDate date] Type:CalendarType_Month];
    __weak typeof(_calendar) weakCalendar = _calendar;
    _calendar.refreshH = ^(CGFloat viewH) {
        [UIView animateWithDuration:0.3 animations:^{
            weakCalendar.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, viewH);
        }];
        
    };
    _calendar.sendSelectDate = ^(NSDate *selDate) {
        NSLog(@"%@",[[YXDateHelpObject manager] getStrFromDateFormat:@"yyyy-MM-dd" Date:selDate]);
    };
    [self.view addSubview:_calendar];
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
