//
//  YMYBarView.h
//  YMDemo
//
//  Created by msy on 2017/4/18.
//  Copyright © 2017年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMYBarView : UIView
/**
 *  坐标值
 */
@property (copy, nonatomic) NSString *yTitle;
/**
 *  y轴的最大值
 */
@property (assign, nonatomic) CGFloat yAxisMaxValue;
/**
 *  y轴分为几段
 */
@property (assign, nonatomic) int numberOfYAxisElements;
/**
 *  x轴文字与坐标轴间隙
 */
@property (assign, nonatomic) CGFloat xAxisTextGap;
/**
 *  y轴文字与坐标轴间隙
 */
@property (assign, nonatomic) CGFloat yAxisTextGap;
/**
 *  文字大小
 */
@property (strong, nonatomic) UIFont *textFont;
/**
 *  文字颜色
 */
@property (strong, nonatomic) UIColor *textColor;
/**
 *  坐标轴颜色
 */
@property (strong, nonatomic) UIColor *axisColor;
/**
 *  是否添加百分号
 */
@property (assign, nonatomic, getter=isPercent) BOOL percent;
/**
 *  视图的背景颜色
 */
@property (strong, nonatomic) UIColor *backColor;
/**
 *  柱的宽度
 */
@property (assign, nonatomic) CGFloat barWidth;

- (void)draw;

@end
