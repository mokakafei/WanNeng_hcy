//
//  MainTableViewController.m
//  万能代码封装
//
//  Created by hcy on 2017/8/7.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "MainTableViewController.h"
#import "RiLiController.h"
#import "SingleSelectController.h"
#import "MADViewController.h"
#import "PaoMaViewController.h"
#import "ButtonViewController.h"
#import "AddViewViewController.h"
#import "AllCategoryListViewController.h"
#import "TableViewController.h"
#import "FangDaHeaderTabelviewViewController.h"
#import "DataPickViewController.h"
#import "AlertTableViewController.h"
#import "WangLuoTiShiViewController.h"
#import "ZJBLTimerViewController.h"
#import "XinxgXingViewController.h"
#import "CityViewController.h"
#import "ChangePayViewController.h"
#import "LocationsViewController.h"
#import "ButtonPaiBanViewController.h"
#import "LiuShuiBuJuDongHuaViewController.h"
#import "TanChuangShiTuZZDZViewController.h"
#import "YeMianJiaZaiViewController.h"
#import "SearchViewController.h"
#import "NNTestViewController.h"
#import "YinDaoYeViewController.h"
#import "TestViewController.h"
#import "ZhiFuJianPanViewController.h"
#import "SJYHSYViewController.h"
#import "SViewController.h"
#import "ZDYJPViewController.h"
#import "JIanSheYIngHangViewController.h"
#import "WMGWCViewController.h"
#import "FMTWMGWCViewController.h"
#import "CJNBLWMMViewController.h"
#import "KYXTDFDXZQViewController.h"


@interface MainTableViewController ()
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation MainTableViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"日历",@"支付方式的选择，只支持单选",@"可以悬停的分段选择器",@"上下垂直滚动的跑马灯", @"Button图片位置自定义",@"为任意视图添加小圆点",@"仿美团全部分类界面",@"刷新",@"tableView滑动header放大的效果",@"最简单的时间选择器",@"弹框选择",@"网络顶部提示框",@"获取验证码倒计时",@"滑动星星评价",@"城市选择器省市区",@"选择支付方式",@"简单定位当前经纬度和位置",@"简单实现多个按钮自适应宽度排版",@"图标流水展开动画",@"弹出视图支持任何定制",@"页面加载数据遮罩HUD",@"UISearchBar 不同样式的搜索框",@"随机图片验证码封装",@"一句话搞定App引导页",@"iOS各种选择器组件",@"支付键盘的封装",@"旋转动画(手机银行首页)",@"下拉菜单",@"自定义数字键盘:带有密码输入框",@"类似建行客户端旋转菜单",@"外卖的购物车",@"仿美团外卖的购物车",@"超级牛逼的6位密码封装",@"tableView多选,全选,删除",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",nil];

    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"主题";
    // 提前为表视图注册单元格，这样从队列中取不到可重用的
    // 可重用的单元格时，系统就根据注册的cell的样式来自动新建
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];

 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 只有上面注册过MyCell这个标识对应的类之后
    // 这句才能工作，系统才会在取不到cell时，自动创建cell
    // 只有使用提前注册再dequeue的方式时，方法才选择
    // 后面带有 forIndexPath这个参数的版本
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"  forIndexPath:indexPath];
//    cell.textLabel.text = @"Hello World";
    cell.textLabel.text  = self.dataArray[indexPath.row];
    return cell;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    if (indexPath.row == 0) {//日历
        RiLiController *vc = [[RiLiController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 1) {//"支付方式的选择，只支持单选"
        SingleSelectController *vc = [[SingleSelectController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    
    if (indexPath.row == 2) {//可以悬停的分段选择器
        KYXTDFDXZQViewController *vc = [[KYXTDFDXZQViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }

    if (indexPath.row == 3) {//"上下垂直滚动的跑马灯"
        PaoMaViewController *vc = [[PaoMaViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 4) {//"Button图片位置自定义"
        ButtonViewController *vc = [[ButtonViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 5) {//"为任意视图添加小圆点"
        AddViewViewController *vc = [[AddViewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 6) {//"仿美团全部分类界面"
        AllCategoryListViewController *vc = [[AllCategoryListViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }

    if (indexPath.row == 7) {//"刷新"
        TableViewController *vc = [[TableViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 8) {//"tableView滑动header放大的效果"
        FangDaHeaderTabelviewViewController *vc = [[FangDaHeaderTabelviewViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }

    if (indexPath.row == 9) {//"最简单的时间选择器"
        DataPickViewController *vc = [[DataPickViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 10) {//"弹框选择"
        AlertTableViewController *vc = [[AlertTableViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 11) {//"网络顶部提示框"
        WangLuoTiShiViewController *vc = [[WangLuoTiShiViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 12) {//"获取验证码倒计时"
        ZJBLTimerViewController *vc = [[ZJBLTimerViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 13) {//"滑动星星评价"
        XinxgXingViewController *vc = [[XinxgXingViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 14) {//"城市选择器省市区"
        CityViewController *vc = [[CityViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 15) {//"选择支付方式"
        ChangePayViewController *vc = [[ChangePayViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }

    if (indexPath.row == 16) {//"简单定位当前经纬度和位置"
        LocationsViewController *vc = [[LocationsViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    
    if (indexPath.row == 17) {//"简单实现多个按钮自适应宽度排版"
        ButtonPaiBanViewController *vc = [[ButtonPaiBanViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 18) {//"图标流水展开动画"
        LiuShuiBuJuDongHuaViewController *vc = [[LiuShuiBuJuDongHuaViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }

    if (indexPath.row == 19) {//"弹出视图支持任何定制"
        TanChuangShiTuZZDZViewController *vc = [[TanChuangShiTuZZDZViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 20) {//页面加载数据遮罩HUD
        YeMianJiaZaiViewController *vc = [[YeMianJiaZaiViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 21) {//UISearchBar 不同样式的搜索框
        SearchViewController *vc = [[SearchViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 22) {//随机图片验证码封装
        NNTestViewController *vc = [[NNTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 23) {//一句话搞定App引导页
        YinDaoYeViewController *vc = [[YinDaoYeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 24) {//iOS各种选择器组件
        TestViewController *vc = [[TestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 25) {//支付键盘的封装
        ZhiFuJianPanViewController *vc = [[ZhiFuJianPanViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 26) {//旋转动画(手机银行首页)
        SJYHSYViewController *vc = [[SJYHSYViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 27) {//下拉菜单
        SViewController *vc = [[SViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 28) {//自定义数字键盘:带有密码输入框
        ZDYJPViewController *vc = [[ZDYJPViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 29) {//类似建行客户端旋转菜单
        JIanSheYIngHangViewController *vc = [[JIanSheYIngHangViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 30) {//外卖的购物车
        WMGWCViewController *vc = [[WMGWCViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 31) {//仿美团外卖的购物车
        FMTWMGWCViewController *vc = [[FMTWMGWCViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }
    if (indexPath.row == 32) {//超级牛逼的6位密码封装
        CJNBLWMMViewController *vc = [[CJNBLWMMViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }


    if (indexPath.row == 33) {//"tableView多选,全选,删除"
        MADViewController *vc = [[MADViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    }

    NSLog(@"点击的是第----%d----行",indexPath.row);
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
