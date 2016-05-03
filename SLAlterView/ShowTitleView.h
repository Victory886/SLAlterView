//
//  ShowTitleView.h
//  SLAlterView
//
//  Created by 收付宝－胜利 on 16/5/3.
//  Copyright © 2016年 胜利_Terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShowTitleView : NSObject

/**
 *  刷新失败或
 *
 *  @param supview 父视图
 *  @param text    文本内容
 *  @param view_y  距离
 *  @param action  按钮事件
 *  @param target  事件目标
 */
- (void)showBtnAndTitleWithView:(UIView *)supview
                           text:(NSString *)text
                         view_y:(float)view_y
                         action:(SEL)action
                         target:(id)target
                       isHidden:(BOOL)isHidden;
/**
 *  隐藏或显示
 *
 *  @param hidden 是否显示
 */
- (void)hiddenBtnAndTitleView:(BOOL)hidden;

@end
