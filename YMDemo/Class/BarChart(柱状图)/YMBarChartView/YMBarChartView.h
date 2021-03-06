//
//  YMBarChartView.h
//  YMDemo
//
//  Created by msy on 2017/4/18.
//  Copyright © 2017年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YMBarChartView;

@protocol YMBarChartViewDelegate <NSObject>

@optional
- (void)barChartView:(YMBarChartView *)barChartView didSelectedBarAtIndex:(NSInteger)index;

@end

@interface YMBarChartView : UIView

@property (weak, nonatomic) id<YMBarChartViewDelegate> delegate;
/**
 *  坐标值
 */
@property (copy, nonatomic) NSString *yTitle;
/**
 *  文字大小
 */
@property (strong, nonatomic) UIFont *textFont;
/**
 *  文字颜色
 */
@property (strong, nonatomic) UIColor *textColor;
/**
 *  x轴文字与坐标轴间隙
 */
@property (assign, nonatomic) CGFloat xAxisTextGap;
/**
 *  坐标轴颜色
 */
@property (strong, nonatomic) UIColor *axisColor;
/**
 *  x轴的文字集合
 */
@property (strong, nonatomic) NSArray *xAxisTitleArray;
/**
 *  柱与柱之间的间距
 */
@property (assign, nonatomic) CGFloat barGap;
/**
 *  柱的宽度
 */
@property (assign, nonatomic) CGFloat barWidth;
/**
 *  柱的颜色
 */
@property (strong, nonatomic) UIColor *barColor;
/**
 *  柱的选中的颜色
 */
@property (strong, nonatomic) UIColor *barSelectedColor;
/**
 *  存放y轴数值的数组
 */
@property (strong, nonatomic) NSArray *xValues;


/**
 *  y轴文字与坐标轴间隙
 */
@property (assign, nonatomic) CGFloat yAxisTextGap;
/**
 *  y轴的最大值
 */
@property (assign, nonatomic) CGFloat yAxisMaxValue;
/**
 *  y轴分为几段
 */
@property (assign, nonatomic) int numberOfYAxisElements;
/**
 *  y轴与左侧的间距
 */
@property (assign, nonatomic) CGFloat yAxisViewWidth;
/**
 *  y轴数值是否添加百分号
 */
@property (assign, nonatomic, getter=isPercent) BOOL percent;
/**
 *  是否显示点Label
 */
@property (assign, nonatomic, getter=isShowPointLabel) BOOL showPointLabel;

/**
 *  视图的背景颜色
 */
@property (strong, nonatomic) UIColor *backColor;
/**
 *  点是否允许点击
 */
@property (assign, nonatomic, getter=isBarUserInteractionEnabled) BOOL barUserInteractionEnabled;

/**
 *  标记选中哪一个柱子
 */
@property (assign, nonatomic) NSInteger index;

/**
 *  快速创建方法
 */
+ (instancetype)barChartView;

- (void)draw;
@end
