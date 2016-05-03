//
//  ShowTitleView.m
//  SLAlterView
//
//  Created by 收付宝－胜利 on 16/5/3.
//  Copyright © 2016年 胜利_Terry. All rights reserved.
//

#import "ShowTitleView.h"

#define kLABFount 17.0f

@interface ShowTitleView ()

@property (nonatomic, copy) UIView *rootView;   //!<

@end

@implementation ShowTitleView

/**
 *  刷新失败或数据为空的时候 显示的内容
 *
 *  @param superview    父视图
 *  @param text         文本内容
 *  @param view_y       距离
 *  @param action       按钮事件
 *  @param target       事件目标
 */
- (void)showBtnAndTitleWithView:(UIView *)superview
                           text:(NSString *)text
                         view_y:(float)view_y
                         action:(SEL)action
                         target:(id)target
                       isHidden:(BOOL)isHidden {
    
    float sl_width = superview.frame.size.width;
    
    
    float x = (sl_width - 80) / 2;
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [btn setTitle:@"点我刷新" forState:(UIControlStateNormal)];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(x, 0, 80, 60);
    
    btn.backgroundColor = [UIColor clearColor];
    [self.rootView addSubview:btn];
    btn.hidden = isHidden;
    
    
    CGFloat size = [self changeStationWidth:text anWidthTxtt:sl_width - 30 anfont:kLABFount];
    
    UILabel *lab = [[UILabel alloc] init];
    lab.frame = CGRectMake(15, btn.frame.size.height + btn.frame.origin.y + 15, sl_width - 30, size);
    lab.font = [UIFont systemFontOfSize:kLABFount];
    lab.backgroundColor = [UIColor clearColor];
    lab.textColor = [UIColor lightGrayColor];
    lab.textAlignment = 1;
    lab.numberOfLines = 0;
    lab.text = text;
    
    [self.rootView addSubview:lab];
    
    self.rootView.frame = CGRectMake(0, superview.frame.origin.y + view_y, sl_width, 80 + size);
    [superview addSubview:self.rootView];
}


- (UIView *)rootView {
    
    if (!_rootView) {
        
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        _rootView = view;
    }
    return _rootView;
}


- (CGFloat)changeStationWidth:(NSString *)string
                  anWidthTxtt:(CGFloat)widthText
                       anfont:(CGFloat)fontSize {
    
    UIFont * tfont = [UIFont systemFontOfSize:fontSize];
    //高度估计文本大概要显示几行，宽度根据需求自己定义。 MAXFLOAT 可以算出具体要多高
    CGSize size = CGSizeMake(widthText,CGFLOAT_MAX);
    //获取当前文本的属性
    NSDictionary *tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    
    return actualsize.height + 10;
}


/**
 *  隐藏或显示
 *
 *  @param hidden 是否显示
 */
- (void)hiddenBtnAndTitleView:(BOOL)hidden {
    
    self.rootView.hidden = hidden;
}

@end
