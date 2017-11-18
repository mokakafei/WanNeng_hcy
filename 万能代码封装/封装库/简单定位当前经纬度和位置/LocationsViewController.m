//
//  LocationsViewController.h
//  万能代码封装
//
//  Created by hcy on 2017/8/13.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "LocationsViewController.h"
@import CoreLocation;
#import <CoreLocation/CoreLocation.h>
@interface LocationsViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;//实例变量
}

@end

@implementation LocationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *Btn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-20, 100, 40)];
    [Btn setTitle:@"开始定位" forState:UIControlStateNormal];
    Btn.backgroundColor = [UIColor colorWithRed:0/255.0 green:160/255.0 blue:222/255.0 alpha:1.0];
    Btn.layer.cornerRadius = 5;
    Btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [Btn addTarget:self action:@selector(ButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Btn];
    
    
}

-(void)ButtonClick{
    
    _locationManager = [[CLLocationManager alloc]init];
    //判断是否启动了定位服务
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务没有开启,请设置打开");
        return;
    }
    //如果用户还没有决定是否使用定位服务
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
        //向用户请求授权
        [_locationManager requestWhenInUseAuthorization];
    }
    //设置委托对象,当定位服务发生事件时通知委托
    _locationManager.delegate = self;
    
    //定位的精度:定位的误差在多少M的范围之内
    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    
    //定位的频率:位置超出多少米定位一次
    _locationManager.distanceFilter = 10.0;
    
    //开始定位
    [_locationManager startUpdatingLocation];
    
    
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", locations);
    CLLocation *location = [locations firstObject];
    CLLocationCoordinate2D coord = location.coordinate;//经纬度
    //    location.altitude; //海拔
    //    location.course;//航向
    //    location.speed;//行走速度
    NSLog(@"经度:%f, 纬度:%f, 海拔:%f, 航向:%f, 速度:%f", coord.longitude, coord.latitude, location.altitude, location.course, location.speed);
    
    
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error){
        
        if (placemarks.count>0) {
            
            CLPlacemark *placeMark = placemarks[0];
            NSLog(@"-国家-%@-城市-%@-当前位置-%@-当前街道-%@-具体位置-%@",placeMark.country,placeMark.locality,placeMark.subLocality,placeMark.thoroughfare,placeMark.name);
            
        }
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
