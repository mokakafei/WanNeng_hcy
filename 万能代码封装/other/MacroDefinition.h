//
//  MacroDefinition.h
//  封装常用的东西
//
//  Created by 蜗牛 on 16/8/22.
//  Copyright © 2016年 *关于蜗牛：一枚九零后码农  蜗牛-----QQ:3197857495-----李富棚  个人微信：woniu1308822159  微信公众号：woniuxueios  简书：蜗牛学IOS  地址：http://www.jianshu.com/users/a664a9fcb096/latest_articles  简书专题：蜗牛学IOS  地址：http://www.jianshu.com/collection/bfcf49bf5d27    蜗牛     */. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h



//************************ 获取设备屏幕尺寸**********************************************

//宽度
#define SCREEN_WIDTH      [UIScreen mainScreen].bounds.size.width
//高度
#define SCREENH_HEIGHT    [UIScreen mainScreen].bounds.size.height
//大小
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

//************************ 获取设备屏幕尺寸**********************************************



//************************ 试图的最大(小)X,Y 试图 的 高度和宽度****************************
//试图的最大(小)X,Y 试图 的 高度和宽度
#define GMXX(view) CGRectGetMaxX((view).frame)
#define GMXY(view) CGRectGetMaxY((view).frame)
#define GMIX(view) CGRectGetMinX((view).frame)
#define GMIY(view) CGRectGetMinY((view).frame)
#define GVH(view)  CGRectGetHeight((view).frame)
#define GVW(view)  CGRectGetWidth((view).frame)
//************************ 试图的最大(小)X,Y 试图 的 高度和宽度****************************



//************************ 设备大小*****************************************************
//最大的屏幕长度
#define SCREEN_MAX_LENGTH       (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
//最小屏幕长度
#define SCREEN_MIN_LENGTH       (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
//iphone4/4s最大屏幕长度
#define ISIPHONE4_OR_LESS       (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
//iphone5最大屏幕长度
#define ISIPHONE5               (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
//iphone6最大屏幕长度
#define ISIPHONE6               (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
//iphone6P最大屏幕长度
#define ISIPHONE6P              (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define ISIOS7_OR_LATER     ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.99)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#pragma mark - ViewSize
#define     ScreenWidth         (ISIPHONE6P? 414:(ISIPHONE6? 375:320))
#define     ScreenHeight        (ISIPHONE6P? 736:(ISIPHONE6? 667:(ISIPHONE5? 568:480)))
#define     NavHeight           44
#define     StateHeight         20

//************************ 设备大小*****************************************************



//************************ 支持横屏宏定义************************************************

//横屏的宽度
#define SCREEN_CROSS_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
//横屏的高度
#define SCREENH_CROSS_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
//横屏的大小
#define SCREEN_CROSS_SIZE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)

//************************ 支持横屏宏定义************************************************



//************************ 判断当前的设备/系统版本*****************************************

//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

//************************ 判断当前的设备/系统版本*****************************************



//************************ 判断是真机还是模拟器********************************************

#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//************************ 判断是真机还是模拟器********************************************



//************************ 获取通知中心**************************************************

#define LFPNotificationCenter [NSNotificationCenter defaultCenter]

//************************ 获取通知中心**************************************************


//************************ 设置颜色******************************************************

//随机RGB颜色
#define LFPRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//设置RGB颜色
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//设置RGBA颜色
#define RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

// rgb颜色转换（16进制->10进制）
#define RGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// clear背景颜色(清除背景色)
#define ClearColor     [UIColor clearColor]
//红色背景色
#define RED_Color      [UIColor redColor]
//绿色背景色
#define GREEN_Color    [UIColor greenColor]
//黑色背景色
#define BLACK_Color    [UIColor blackColor]
//白色背景色
#define WHITE_Color    [UIColor whiteColor]
//灰色背景色
#define GRAY_Color     [UIColor grayColor]
//深灰色
#define DARK_GRAY      [UIColor darkGrayColor]
//浅灰色
#define LIGHT_GRAY     [UIColor lightGrayColor]
//青色
#define CYAN_GRAY      [UIColor cyanColor]
//黄色
#define YELLOW_GRAY    [UIColor yellowColor]
//品红色
#define MAGENTA_GRAY   [UIColor magentaColor]
//橙色
#define ORANGE_GRAY    [UIColor orangeColor]
//紫色
#define PURPLE_GRAY    [UIColor purpleColor]
//布朗色
#define BROWN_GRAY     [UIColor brownColor]
//蓝色
#define BLUE_GRAY     [UIColor blueColor]

//************************ 设置颜色******************************************************



//************************ NSUserDefaults 实例化 取值************************************

#define USERDEFAULT [NSUserDefaults standardUserDefaults]

#define USERDEFAULT_value(key) [[NSUserDefaults standardUserDefaults] valueForKey:key]

#define USERDEFAULT_object(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define USERDEFAULT_BOOL(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]

#define USERDEFAULT_integer(key) [[NSUserDefaults standardUserDefaults] integerForKey:key]

#define USERDEFAULT_int(key) [[[NSUserDefaults standardUserDefaults] objectForKey:key] intValue]

//************************ NSUserDefaults 实例化 取值************************************



//************************ NSUserDefaults 实例化 存值************************************

//NSUserDefaults 实例化 存值
// object
#define USERDEFAULT_SET_value(_value_,_key_) [[NSUserDefaults standardUserDefaults] setValue:_value_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

#define USERDEFAULT_SET_object(_object_,_key_) [[NSUserDefaults standardUserDefaults] setObject:_object_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

// int
#define USERDEFAULT_SET_int(_int_,_key_) NSString *uIntString=[NSString stringWithFormat:@"%d",_int_];\
[[NSUserDefaults standardUserDefaults] setObject:uIntString forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

//float
#define USERDEFAULT_SET_float(_float_,_key_) NSString *uFloatString=[NSString stringWithFormat:@"%f",_float_];\
[[NSUserDefaults standardUserDefaults] setObject:uFloatString forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize]

#define USERDEFAULT_SET_bool(_bool_,_key_)   [[NSUserDefaults standardUserDefaults]setBool:_bool_ forKey:_key_];\
[[NSUserDefaults standardUserDefaults] synchronize];

//************************ NSUserDefaults 实例化 存值************************************



//************************ 自定义高效率的 NSLog*******************************************

#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"---[方法名:%s]\n---[行号:%d]\n---打印内容:\n%s\n",__FUNCTION__, __LINE__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//************************ 自定义高效率的 NSLog*******************************************


/*
 字体
 */
#define     Font(F)             [UIFont systemFontOfSize:(F)]

/*
 弱引用/强引用
 */
//弱引用
#define WeakSelf(type)    __weak typeof(type) weak##type = type;
//强引用
#define StrongSelf(type)  __strong typeof(type) type = weak##type;



//************************ 设置 view 圆角和边框*******************************************
/*
 设置 view 圆角和边框
 */
#define ViewBorderRadius(View, Radius, Width, Color,Bounds)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:(Bounds)];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//************************ 设置 view 圆角和边框*******************************************



//************************  由角度转换弧度 由弧度转换角度***********************************

#define DegreesToRadian(x) (M_PI * (x) / 180.0)
#define RadianToDegrees(radian) (radian*180.0)/(M_PI)

//************************  由角度转换弧度 由弧度转换角度***********************************



//************************  获取图片资源*************************************************
//获取图片资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//************************  获取图片资源*************************************************


//************************  获取当前语言与地区********************************************
//获取当前语言与地区
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//************************  获取当前语言与地区********************************************


//************************  GCD 的宏定义************************************************

//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

//************************  GCD 的宏定义************************************************




#endif /* MacroDefinition_h */
