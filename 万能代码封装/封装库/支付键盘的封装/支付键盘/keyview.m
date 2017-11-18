
//
//  keyview.m
//  支付键盘的封装
//
//  Created by 王文志 on 2016/12/8.
//  Copyright © 2016年 王文志. All rights reserved.
//

#import "keyview.h"
@interface keyview ()
{
    UIButton   *selectedBtn;
    NSString  *strting;
    NSString  *strtingzo;
    NSInteger   gao;
    UIView    *mima;
    UIView   *yuanview;
    UIView   *clearview;//密码圆圈的显示
    NSArray   *arraynumber;//数字乱排
    NSMutableArray   *muberarray;
}
@property (nonatomic, strong) ButtonBlock block1;

@end
@implementation keyview
-(instancetype)initWithFrame:(CGRect)frame addButtonAction:(ButtonBlock)block
{
    [self    arraynumber];
    [self   randamArry:arraynumber];
    if (self=[super  initWithFrame:frame]) {
        self.backgroundColor=[UIColor    clearColor];
        biahuan=[[UIView   alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        biahuan.backgroundColor=[UIColor    clearColor];
        [self    addSubview:biahuan];
        /*************************透明的view***************************************/
        UIView   *tumingview1=[[UIView   alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height-self.frame.size.width*5/6)];
        tumingview1.backgroundColor=[UIColor    grayColor];
        tumingview1.alpha=0.6;
        [biahuan   addSubview:tumingview1];
        /*************************键盘的view***************************************/
        UIView   *Keyview2=[[UIView   alloc]initWithFrame:CGRectMake(0, self.frame.size.height-self.frame.size.width*5/6, self.frame.size.width, self.frame.size.width*5/6)];
        [biahuan  addSubview:Keyview2];
        
        /*************************显示字体的view***************************************/
        UIView   *xianshiview=[[UIView   alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width*2/6)];
        xianshiview.backgroundColor=[UIColor  whiteColor];
        [Keyview2   addSubview:xianshiview];
        
                  //标签的view
        UIView    *zitiview=[[UIView   alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, xianshiview.frame.size.height*3/7)];
        [xianshiview  addSubview:zitiview];
                          //X的关闭视图
        UIButton   *UIXX=[[UIButton   alloc]initWithFrame:CGRectMake(zitiview.frame.size.height/8, zitiview.frame.size.height/8, zitiview.frame.size.height*3/4, zitiview.frame.size.height*3/4)];
        [UIXX     setImage:[UIImage  imageNamed:@"XXXXXX"] forState:UIControlStateNormal];
//        [UIXX.imageView  setContentMode:UIViewContentModeScaleAspectFill];
        [UIXX   addTarget:self action:@selector(guanbiXX) forControlEvents:UIControlEventTouchUpInside];
        [xianshiview  addSubview:UIXX];
                          //中间的请输入支付密码
        UILabel   *zhifuLable=[[UILabel     alloc]initWithFrame:CGRectMake(zitiview.frame.size.height, 0, zitiview.frame.size.width-2*zitiview.frame.size.height, zitiview.frame.size.height)];
        zhifuLable.text=@"请输入支付密码";
        zhifuLable.textColor=[UIColor     blackColor];
        zhifuLable.textAlignment=NSTextAlignmentCenter;
        zhifuLable.font=[UIFont    systemFontOfSize:zhifuLable.frame.size.height/3];
        [zitiview  addSubview:zhifuLable];
        /*************************中间密码的显示框***************************************/
        mima=[[UIView   alloc]initWithFrame:CGRectMake(self.frame.size.width/2-xianshiview.frame.size.height*9/7, xianshiview.frame.size.height*3/7, xianshiview.frame.size.height*18/7, xianshiview.frame.size.height*3/7)];
        mima.backgroundColor=[UIColor     grayColor];
        [xianshiview  addSubview:mima];
       
        //用for循环创建UILable
       gao=mima.frame.size.height-2;
        for (int i=0; i<6; i++) {
            UILabel   *baise=[[UILabel  alloc]initWithFrame:CGRectMake(1+((mima.frame.size.width-7)/6+1)*i, 1, (mima.frame.size.width-7)/6, gao)];
            baise.backgroundColor=[UIColor   whiteColor];
            [mima   addSubview:baise];
        }
        /*************************下面的数组键盘的view***************************************/
        UIView   *Keyshuziview=[[UIView   alloc]initWithFrame:CGRectMake(0,Keyview2.frame.size.width/3 , Keyview2.frame.size.width, Keyview2.frame.size.width/2)];
        Keyshuziview.backgroundColor=[UIColor    grayColor];
        [Keyview2  addSubview:Keyshuziview];
        //键盘按钮
        for (int j=0; j<9; j++) {
            UIButton   *anbtn=[[UIButton   alloc]initWithFrame:CGRectMake(((Keyshuziview.frame.size.width)/4)*(j%3),1+((Keyshuziview.frame.size.height)/3)*(j/3), (Keyshuziview.frame.size.width)/4-1, (Keyshuziview.frame.size.height)/3-1)];
            anbtn.backgroundColor=[UIColor whiteColor];
            [anbtn   setTitle:[NSString   stringWithFormat:@"%@",muberarray[j]] forState:UIControlStateNormal];
            anbtn.tag=300000000+j;
            [anbtn  setTitleColor:[UIColor     blackColor] forState:UIControlStateNormal];
            [anbtn   addTarget:self action:@selector(anbtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [Keyshuziview   addSubview:anbtn];
        }
        //删除按钮和0，确定按钮
        for (int   q=0; q<3; q++) {
            UIButton    *leianbtn=[[UIButton   alloc]initWithFrame:CGRectMake(((Keyshuziview.frame.size.width)/4)*(3%4), 1+(Keyshuziview.frame.size.height/3)*(q/1), (Keyshuziview.frame.size.width)/4-1, (Keyshuziview.frame.size.height)/3-1)];
            if (q==0) {
                  leianbtn.backgroundColor=[UIColor   whiteColor];
                [leianbtn   setImage:[UIImage   imageNamed:@"keyboard_backspace"] forState:UIControlStateNormal];
            }
          else  if (q==1) {
                leianbtn.backgroundColor=[UIColor   whiteColor];
              [leianbtn    setTitle:muberarray[9] forState:UIControlStateNormal];
              [leianbtn   setTitleColor:[UIColor   blackColor] forState:UIControlStateNormal];
            }
          else if (q==2){
              leianbtn.backgroundColor=[UIColor   colorWithRed:74/255.0 green:186/255.0 blue:237/255.0 alpha:1];
              [leianbtn    setTitle:@"确定" forState:UIControlStateNormal];
          }
            leianbtn.tag=300000000+9+q;
            [leianbtn   addTarget:self action:@selector(anbtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [Keyshuziview  addSubview:leianbtn];
        }
       self.block1 = block;
        
        
       
    }
    return self;
}
-(NSArray*)arraynumber
{
    if (arraynumber==nil) {
        arraynumber=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    }
    return arraynumber;
}
- (void)randamArry:(NSArray *)arry
{
    // 对数组乱序
    arry = [arry sortedArrayUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
        int seed = arc4random_uniform(2);
        
        if (seed) {
            return [str1 compare:str2];
        } else {
            return [str2 compare:str1];
        }
    }];
    muberarray=[[NSMutableArray   alloc]init];
    for (NSString *str in arry) {
     [muberarray   addObject:str];
    }
    NSLog(@"%@",muberarray);
}
-(void)guanbiXX//关闭支付密码视图
{
   
    [self   removeFromSuperview];
}
-(void)anbtnClicked:(UIButton*)sender
{

       //选中变灰色 其他按钮变为自己本身的颜色
    selectedBtn = sender;
    selectedBtn.backgroundColor = [UIColor   whiteColor];
    if (selectedBtn) {
        selectedBtn.backgroundColor = [UIColor grayColor];
        [UIView   animateWithDuration:0.2 animations:^{
            if (sender.tag==300000011) {
                selectedBtn.backgroundColor = [UIColor   colorWithRed:74/255.0 green:186/255.0 blue:237/255.0 alpha:1];
            }
            else{
                selectedBtn.backgroundColor = [UIColor whiteColor];
            }
        } completion:^(BOOL finished) {

        }];
        
        
    }
   /*************************开始做逻辑操作***************************************/
    strting=[NSString   new];//密码显示
    strting=strtingzo;

    if (sender.tag==300000011) {
        if ([strting  length]==6) {
            if (self.block1) {
                self.block1(strting);//开始传值
            }
        }
        else{
            NSLog(@"你输入的密码格式不对");
        }
    }
    else{
        //这里面写消失动画
        if(sender.tag==300000009){//删除的按钮
            if ([strting  length]>0) {
                strtingzo = [strting substringToIndex:[strting   length]-1];
            }
                                  }
    else         {//数字响应事件
        if ([strting   length]<6) {//密码小于6位数
            if (sender.tag==300000010) {
                if (strtingzo==nil){
                    strtingzo =[NSString   stringWithFormat:@"%@",muberarray[sender.tag-300000001]];
                }else {strtingzo =[NSString   stringWithFormat:@"%@%@",strtingzo,muberarray[sender.tag-300000001]];}
            }
            else{
                if (strtingzo==nil){
                    strtingzo =[NSString   stringWithFormat:@"%@",muberarray [sender.tag-300000000]];
                }else {strtingzo =[NSString   stringWithFormat:@"%@%@",strtingzo,muberarray [sender.tag-300000000]];}
            }

        }
    }
         [self   heisehcuangjian];//黑色密码
        
        }
}
-(void)heisehcuangjian
{
    /*************************隐藏密码的uiview***************************************/
    if ([strting  length] !=[strtingzo  length]) {
        [clearview    removeFromSuperview];
        clearview=[[UIView   alloc]initWithFrame:CGRectMake(0, 0, mima.frame.size.width, mima.frame.size.height)];
        clearview.backgroundColor=[UIColor  clearColor];
        [mima   addSubview:clearview];
        for (int  t=0; t<[strtingzo  length]; t++) {
            yuanview=[[UIView  alloc]initWithFrame:CGRectMake(1+((mima.frame.size.width-7)/6+1)*t, 1, (mima.frame.size.width-7)/6, gao)];
            UIView    *heiyuan=[[UIView   alloc]initWithFrame:CGRectMake(yuanview.frame.size.width/2, yuanview.frame.size.height/2, yuanview.frame.size.width/10, yuanview.frame.size.width/10)];
            heiyuan.backgroundColor=[UIColor   blackColor];
            [yuanview  addSubview:heiyuan];
            [clearview  addSubview:yuanview];
        }
    }
}
@end
