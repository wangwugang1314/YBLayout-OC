//
//  UIView+YBLayout_OC.h
//  YBXX-OC
//
//  Created by FuYun on 2016/12/12.
//  Copyright © 2016年 FuYun. All rights reserved.
//

#import <UIKit/UIKit.h>

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
 平铺俯视图(子试图在方法里面已经添加到父试图上面)
 
 @param views 子试图数组(个数必须大于1)
 @param interval 子试图的间隔
 @param duration 横向平铺还是纵向平铺
 @param edge 子试图与父试图的边缘
 */
- (void)yb_fill:(NSArray<UIView*>*)views interval:(CGFloat)interval duration:(YBLayoutDuration)duration edge:(UIEdgeInsets)edge;

#pragma mark - 平铺俯视图(单个)
/**
 平铺俯视图 (单个子试图)
 
 @param view 子试图
 @param edge 边距
 @param isAdd 是否需要添加到俯视图
 */
- (void)yb_fill:(UIView *)view edge:(UIEdgeInsets)edge isAdd:(BOOL)isAdd;

#pragma mark - 设置试图的大小
/**
 设置试图的大小
 
 @param size 试图大小
 */
- (void)yb_size:(CGSize)size;

#pragma mark - 中间布局
/**
 中间布局
 
 @param view 子试图
 @param offset 子试图偏移量
 @param isAdd 是否添加
 */
- (void)yb_center:(UIView *)view offset:(UIOffset)offset isAdd:(BOOL)isAdd;


/**
 中间布局(默认添加上了)
 
 @param view 子试图
 @param offset 子试图偏移量
 */
- (void)yb_center:(UIView *)view offset:(UIOffset)offset;

/**
 中间布局(默认添加上了)
 
 @param view 子试图
 */
- (void)yb_center:(UIView *)view;

/**
 中间布局
 
 @param view 子试图
 @param size 子试图大小
 @param offset 子试图偏移量
 @param isAdd 是否添加
 */
- (void)yb_center:(UIView *)view size:(CGSize)size offset:(UIOffset)offset isAdd:(BOOL)isAdd ;

/**
 中间布局(默认添加)
 
 @param view 子试图
 @param size 子试图大小
 @param offset 子试图偏移量
 */
- (void)yb_center:(UIView *)view size:(CGSize)size offset:(UIOffset)offset;

/**
 中间布局(默认添加)
 
 @param view 子试图
 @param size 子试图大小
 */
- (void)yb_center:(UIView *)view size:(CGSize)size;

#pragma mark - 内部布局
/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration offset:(UIOffset)offset isAdd:(BOOL)isAdd;

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param offset 偏移量
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration offset:(UIOffset)offset;

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration;

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param size 大小
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset isAdd:(BOOL)isAdd;

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param size 大小
 @param offset 偏移量
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset;

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param size 大小
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration size:(CGSize)size;

#pragma mark - 外部布局


/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration offset:(UIOffset)offset isAdd:(BOOL)isAdd;

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param offset 偏移量
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration offset:(UIOffset)offset;

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration;


/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param size 大小
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset isAdd:(BOOL)isAdd;

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param size 大小
 @param offset 偏移量
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset;

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param size 大小
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration size:(CGSize)size;

@end
