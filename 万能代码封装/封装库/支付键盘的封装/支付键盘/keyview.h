//
//  keyview.h
//  支付键盘的封装
//
//  Created by 王文志 on 2016/12/8.
//  Copyright © 2016年 王文志. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ButtonBlock) (NSString *sender);
@interface keyview : UIView{
    UIView   *biahuan;//最底层的变换view
}
-(instancetype)initWithFrame:(CGRect)frame  addButtonAction:(ButtonBlock)block;
@end
