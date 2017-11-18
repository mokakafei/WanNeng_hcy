//
//  LiuShuiBuJuDongHuaViewController.h
//  万能代码封装
//
//  Created by hcy on 2017/8/13.
//  Copyright © 2017年 hcy. All rights reserved.
//

#import "LiuShuiBuJuDongHuaViewController.h"

@interface LiuShuiBuJuDongHuaViewController ()

@end

@implementation LiuShuiBuJuDongHuaViewController
{
    UIButton* _btn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self adview];
}

-(void)adview{
    _btn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-60, 10+navHeight, 60,60)];
    _btn.tag=103;
    [_btn setBackgroundImage:[UIImage imageNamed:@"菜单正常"] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(animationBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
      
    NSArray* arr=@[@"个人设置",@"退出登录",@"个人退回"];
    for (int i=0; i<3; i++) {
        UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMidX(_btn.frame)-10,-40*i-50, 45, 45)];
        btn.tag=100+i;
        [btn setBackgroundImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(animationBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = btn.frame.size.width/2;
    }
}

#pragma mark  右上角按钮触发事件
//103为大按钮 100~102为小按钮
-(void)animationBtn:(UIButton*)btn{
    
    if (btn.tag==103) {
        [UIView animateWithDuration:1 animations:^(){
            _btn.alpha=0.5;
        }];
        [_btn setUserInteractionEnabled:NO];
        UIButton*btn1=(UIButton*)[self.view viewWithTag:100];
        UIButton*btn2=(UIButton*)[self.view viewWithTag:101];
        UIButton*btn3=(UIButton*)[self.view viewWithTag:102];
        [btn3 setUserInteractionEnabled:YES];
        CGPoint btn3Size=CGPointMake(CGRectGetMidX(btn.frame)-10,CGRectGetMaxY(btn.frame)+25);
        CGPoint btn2Size=CGPointMake(CGRectGetMidX(btn.frame)-52,CGRectGetMaxY(btn.frame)+10);
        CGPoint btn1Size=CGPointMake(CGRectGetMidX(btn.frame)-70,CGRectGetMidY(btn.frame));
        
        [self animationStarAction:btn andBtn:btn1 andSize:btn1Size andTime:CGRectGetMaxY(btn.frame)+20];
        [self animationStarAction:btn andBtn:btn2 andSize:btn2Size andTime:CGRectGetMaxY(btn.frame)+20];
        [self animationStarAction:btn andBtn:btn3 andSize:btn3Size andTime:CGRectGetMaxY(btn.frame)+20];
        
    }else if (btn.tag==100){
        NSLog(@"搜索的内容是11111: %@", btn.titleLabel.text);
        
    }
    else if(btn.tag==101){
        NSLog(@"搜索的内容是2222: %@", btn.titleLabel.text);
        
    }
    else if(btn.tag==102){
        NSLog(@"搜索的内容是333: %@", btn.titleLabel.text);
        
        [UIView animateWithDuration:1 animations:^(){
            _btn.alpha=1;
        }];
        [_btn setUserInteractionEnabled:YES];
        UIButton*btn1=(UIButton*)[self.view viewWithTag:100];
        UIButton*btn2=(UIButton*)[self.view viewWithTag:101];
        UIButton*btn3=(UIButton*)[self.view viewWithTag:102];
        [btn3 setUserInteractionEnabled:NO];
        CGPoint btn3Size=CGPointMake(CGRectGetMidX(_btn.frame)-10,CGRectGetMaxY(_btn.frame)+25);
        CGPoint btn2Size=CGPointMake(CGRectGetMidX(_btn.frame)-52,CGRectGetMaxY(_btn.frame)+10);
        CGPoint btn1Size=CGPointMake(CGRectGetMidX(_btn.frame)-70,CGRectGetMidY(_btn.frame));
        
        [self animationFinish:btn3 andSize:btn3Size];
        [self animationFinish:btn2 andSize:btn2Size];
        [self animationFinish:btn1 andSize:btn1Size];
        btn1.center=CGPointMake(0, -50);
        btn2.center=CGPointMake(0, -50);
        btn3.center=CGPointMake(0, -50);
    }
    
}

#pragma mark 动画实现方法
-(void)animationStarAction:(UIButton* )btn andBtn:(UIButton*)btn1 andSize:(CGPoint)btnSize andTime:(NSInteger)location {
    // 创建一个贝塞尔曲线句柄
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration=1.0f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    //    animation.repeatCount=HUGE_VALF;// repeat forever
    animation.calculationMode = kCAAnimationCubicPaced;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, btn.frame.origin.x-40, -50);
    
    
    CGPoint point=CGPointMake(270, 120);
    CGPoint point1=CGPointMake(CGRectGetMidX(btn.frame)-40,location);
    
    
    CGPathAddQuadCurveToPoint(curvedPath, NULL,point.x, point.y,self.view.bounds.size.width-10,CGRectGetMaxY(btn.frame)+30);
    
    CGPathAddQuadCurveToPoint(curvedPath, NULL,point1.x, point1.y,btnSize.x,btnSize.y);
    //1.5设置动画的节奏
    animation.timingFunction= [CAMediaTimingFunction functionWithControlPoints:0.3:0:0.1:0.1];
    
    animation.path=curvedPath;
    animation.delegate=self;
    [btn1.layer addAnimation:animation forKey:nil];
    
    btn1.center=btnSize;//让按钮放在动画结束的地方
    
}
#pragma mark 动画返回方法
-(void)animationFinish:(UIButton*)btn1 andSize:(CGPoint)btnSize {
    // 创建一个贝塞尔曲线句柄
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration=1.0f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    //    animation.repeatCount=HUGE_VALF;// repeat forever
    animation.calculationMode = kCAAnimationCubicPaced;
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, btnSize.x,btnSize.y);
    CGPoint point=CGPointMake(230 ,-20);
    
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(point.x, point.y, 3, 3 )];
    label.backgroundColor=[UIColor redColor ];
    [self.view addSubview:label];
    
    CGPathAddQuadCurveToPoint(curvedPath, NULL,point.x, point.y,_btn.frame.origin.x,-40);
    
    //1.5设置动画的节奏
    animation.timingFunction= [CAMediaTimingFunction functionWithControlPoints:0.3:0:0.1:0.1];
    
    animation.path=curvedPath;
    animation.delegate=self;
    [btn1.layer addAnimation:animation forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
