//
//  UIView+YBLayout_OC.h
//  YBXX-OC
//
//  Created by FuYun on 2016/12/12.
//  Copyright © 2016年 FuYun. All rights reserved.
//

/*
 注意事项:
    1. 父试图, 如果子试图已经添加到父试图，即便是指定了父试图也不会重复添加
        如果没有添加到父试图，写上了父试图就会添加到指定父试图
        如果没有添加到父试图又没有指定父试图则会默认添加到参考试图上
    2. 宽高约束, 默认没有约束的情况下会创建约束
 */

#import <UIKit/UIKit.h>
#import "YBLayoutConstraint.h"

/// 平铺布局方向
typedef NS_ENUM(NSInteger, YBLayoutDuration) {
    YBLayoutDurationHorizon,
    YBLayoutDurationVertical,
};

/// 内部方向
typedef NS_ENUM(NSInteger, YBLayoutIn) {
    YBLayoutInLeftTop,
    YBLayoutInLeftCenter,
    YBLayoutInLeftBottom,
    YBLayoutInCenterTop,
    YBLayoutInCenterCenter,
    YBLayoutInCenterBottom,
    YBLayoutInRightTop,
    YBLayoutInRightCenter,
    YBLayoutInRightBottom,
};

/// 外部方向
typedef NS_ENUM(NSInteger, YBLayoutOut) {
    YBLayoutOutTopLeft,
    YBLayoutOutTopCenter,
    YBLayoutOutTopRight,
    YBLayoutOutBottomLeft,
    YBLayoutOutBottomCenter,
    YBLayoutOutBottomRight,
    YBLayoutOutLeftTop,
    YBLayoutOutLeftCenter,
    YBLayoutOutLeftBottom,
    YBLayoutOutRightTop,
    YBLayoutOutRightCenter,
    YBLayoutOutRightBottom,
    YBLayoutOutAngleLeftTop,
    YBLayoutOutAngleLeftBottom,
    YBLayoutOutAngleRightTop,
    YBLayoutOutAngleRightBottom,
};

@interface UIView (YBLayout_OC)

#pragma mark - 平铺俯视图(多个)
/**
 平铺视图(self指的是参照试图)
 
 @param layoutViews 需要布局的试图数组(个数必须大于1)
 @param duration 布局位置
 @param interval 子试图的间隔
 @param edge 子试图与父试图的边缘
 @param superView 父试图
 */
- (void)yb_fill:(NSArray<UIView*>*)layoutViews duration:(YBLayoutDuration)duration interval:(CGFloat)interval edge:(UIEdgeInsets)edge superview:(UIView *)superView ;
- (void)yb_fill:(NSArray<UIView*>*)layoutViews duration:(YBLayoutDuration)duration interval:(CGFloat)interval edge:(UIEdgeInsets)edge;
- (void)yb_fill:(NSArray<UIView*>*)layoutViews duration:(YBLayoutDuration)duration;

#pragma mark - 平铺俯视图(单个)
/**
 平铺视图 (self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param edge 边距
 @param superView 父试图
 */
- (void)yb_fill:(UIView *)layoutView edge:(UIEdgeInsets)edge superView:(UIView *)superView;
- (void)yb_fill:(UIView *)layoutView edge:(UIEdgeInsets)edge;
- (void)yb_fill:(UIView *)layoutView ;

#pragma mark - 设置试图的大小
/**
 设置试图的大小(self指的是需要布局的试图)
 
 @param size 试图大小
 */
- (void)yb_size:(CGSize)size;

#pragma mark - 中间布局


/**
 中间布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param size 子试图大小
 @param offset 子试图偏移量
 @param superView 父试图
 */
- (void)yb_center:(UIView *)layoutView size:(CGSize)size offset:(UIOffset)offset superView:(UIView *)superView;
- (void)yb_center:(UIView *)layoutView size:(CGSize)size offset:(UIOffset)offset;
- (void)yb_center:(UIView *)layoutView size:(CGSize)size;
- (void)yb_center:(UIView *)layoutView offset:(UIOffset)offset superView:(UIView *)superView;
- (void)yb_center:(UIView *)layoutView offset:(UIOffset)offset;
- (void)yb_center:(UIView *)layoutView;

#pragma mark - 内部布局

/**
 内部试图布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 @param offset 偏移量
 @param superView 父试图
 */
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset superView:(UIView *)superView;
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset;
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration size:(CGSize)size;
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration offset:(UIOffset)offset superView:(UIView *)superView;
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration offset:(UIOffset)offset;
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration;

#pragma mark - 外部布局

/**
 外部布局子试图(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 @param offset 偏移量
 @param superView 父试图
 */
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset superView:(UIView *)superView;
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset;
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration size:(CGSize)size;
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration offset:(UIOffset)offset superView:(UIView *)superView;
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration offset:(UIOffset)offset;
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration;

#pragma mark - 约束

/**
 获取指定的约束(self指的是需要布局的试图)
 
 @param layoutType 约束类型
 @return 返回自定义的约束
 */
- (YBLayoutConstraint *)constraintWithType:(YBLayoutType)layoutType;


/**
 设置指定约束(self指的是需要布局的试图)
 
 @param layoutType 约束类型
 @param constant 约束值
 */
- (void)setConstraintWithType:(YBLayoutType)layoutType constant:(CGFloat)constant;

@end
