//
//  UIView+YBLayout_OC.m
//  YBXX-OC
//
//  Created by FuYun on 2016/12/12.
//  Copyright © 2016年 FuYun. All rights reserved.
//

#import "UIView+YBLayout.h"

@implementation UIView (YBLayout_OC)

#pragma mark - 平铺俯视图(多个)
/**
 平铺视图(self指的是参照试图)

 @param layoutViews 需要布局的试图数组(个数必须大于1)
 @param duration 布局位置
 @param interval 子试图的间隔
 @param edge 子试图与父试图的边缘
 @param superView 父试图
 */
- (void)yb_fill:(NSArray<UIView*>*)layoutViews duration:(YBLayoutDuration)duration interval:(CGFloat)interval edge:(UIEdgeInsets)edge superview:(UIView *)superView {
    // 数组个数必须大于一个
    NSAssert(layoutViews.count > 1, @"数组个数必须大于1");
    [layoutViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *sView = [self getSuperWithLayoutView:obj superView:superView];
        if(duration == YBLayoutDurationHorizon) {
            if (idx == 0) {
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:edge.left layoutTypr:YBLayoutTypeLeft]];
            } else if (idx == layoutViews.count - 1) {
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:-edge.right layoutTypr:YBLayoutTypeRight]];
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeLeft toItem:layoutViews[idx - 1] attribute:NSLayoutAttributeRight constant:interval layoutTypr:YBLayoutTypeLeft]];
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeWidth toItem:layoutViews.firstObject attribute:NSLayoutAttributeWidth constant:0 layoutTypr:YBLayoutTypeWidth]];
            } else {
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeLeft toItem:layoutViews[idx - 1] attribute:NSLayoutAttributeRight constant:interval layoutTypr:YBLayoutTypeLeft]];
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeWidth toItem:layoutViews.firstObject attribute:NSLayoutAttributeWidth constant:0 layoutTypr:YBLayoutTypeWidth]];
            }
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:edge.top layoutTypr:YBLayoutTypeTop]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:-edge.bottom layoutTypr:YBLayoutTypeBottom]];
        }else{
            if (idx == 0) {
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:edge.top layoutTypr:YBLayoutTypeTop]];
            } else if (idx == layoutViews.count - 1) {
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:-edge.bottom layoutTypr:YBLayoutTypeBottom]];
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeTop toItem:layoutViews[idx - 1] attribute:NSLayoutAttributeBottom constant:interval layoutTypr:YBLayoutTypeTop]];
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeHeight toItem:layoutViews.firstObject attribute:NSLayoutAttributeHeight constant:0 layoutTypr:YBLayoutTypeHeight]];
            } else {
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeTop toItem:layoutViews[idx - 1] attribute:NSLayoutAttributeBottom constant:interval layoutTypr:YBLayoutTypeTop]];
                [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeHeight toItem:layoutViews.firstObject attribute:NSLayoutAttributeHeight constant:0 layoutTypr:YBLayoutTypeHeight]];
            }
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:edge.left layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:obj attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:-edge.right layoutTypr:YBLayoutTypeRight]];
        }
    }];
}

/**
 平铺俯视图(self指的是参照试图)
 
 @param layoutViews 需要布局的子试图数组(个数必须大于1)
 @param duration 布局位置
 @param interval 子试图的间隔
 @param edge 子试图与父试图的边缘
 */
- (void)yb_fill:(NSArray<UIView*>*)layoutViews duration:(YBLayoutDuration)duration interval:(CGFloat)interval edge:(UIEdgeInsets)edge {
    [self yb_fill:layoutViews duration:duration interval:interval edge:edge superview:nil];
}

/**
 平铺俯视图(self指的是参照试图)
 
 @param layoutViews 需要布局的试图数组(个数必须大于1)
 @param duration 布局位置
 */
- (void)yb_fill:(NSArray<UIView*>*)layoutViews duration:(YBLayoutDuration)duration {
    [self yb_fill:layoutViews duration:duration interval:0 edge:UIEdgeInsetsZero superview:nil];
}

#pragma mark - 平铺俯视图(单个)
/**
 平铺视图 (self指的是参照试图)

 @param layoutView 要布局的试图
 @param edge 边距
 @param superView 父试图
 */
- (void)yb_fill:(UIView *)layoutView edge:(UIEdgeInsets)edge superView:(UIView *)superView {
    // 父试图
    UIView *sView = [self getSuperWithLayoutView:layoutView superView:superView];
    NSLayoutConstraint *topConstraint = [YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:edge.top layoutTypr:YBLayoutTypeTop];
    NSLayoutConstraint *leftConstraint = [YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:edge.left layoutTypr:YBLayoutTypeLeft];
    NSLayoutConstraint *bottomConstraint = [YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:-edge.bottom layoutTypr:YBLayoutTypeBottom];
    NSLayoutConstraint *rightConstraint = [YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:-edge.right layoutTypr:YBLayoutTypeRight];
    // 设置约束属性
    [sView addConstraints:@[topConstraint, leftConstraint, bottomConstraint, rightConstraint]];
}

/**
 平铺视图 (self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param edge 边距
 */
- (void)yb_fill:(UIView *)layoutView edge:(UIEdgeInsets)edge {
    [self yb_fill:layoutView edge:edge superView:nil];
}

/**
 平铺视图 (self指的是参照试图)
 
 @param layoutView 要布局的试图
 */
- (void)yb_fill:(UIView *)layoutView  {
    [self yb_fill:layoutView edge:UIEdgeInsetsZero superView:nil];
}

#pragma mark - 设置试图的大小
/**
 设置试图的大小(self指的是需要布局的试图)

 @param size 试图大小
 */
- (void)yb_size:(CGSize)size {
    NSAssert(self.superview != nil, @"添加约束前必须要添加到父试图");
    [self setConstraintWithType:YBLayoutTypeWidth constant:size.width];
    [self setConstraintWithType:YBLayoutTypeHeight constant:size.height];
}

#pragma mark - 中间布局
/**
 中间布局(self指的是参照试图)

 @param layoutView 要布局的试图
 @param offset 子试图偏移量
 @param superView 父试图
 */
- (void)yb_center:(UIView *)layoutView offset:(UIOffset)offset superView:(UIView *)superView {
    UIView *sView = [self getSuperWithLayoutView:layoutView superView:superView];
    [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterX toItem:self attribute:NSLayoutAttributeCenterX constant:offset.horizontal layoutTypr:YBLayoutTypeCenterX]];
    [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterY toItem:self attribute:NSLayoutAttributeCenterY constant:offset.vertical layoutTypr:YBLayoutTypeCenterY]];
}


/**
 中间布局(self指的是参照试图)

 @param layoutView 要布局的试图
 @param offset 子试图偏移量
 */
- (void)yb_center:(UIView *)layoutView offset:(UIOffset)offset{
    [self yb_center:layoutView offset:offset superView:nil];
}

/**
 中间布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 */
- (void)yb_center:(UIView *)layoutView{
    [self yb_center:layoutView offset:UIOffsetZero superView:nil];
}

/**
 中间布局(self指的是参照试图)

 @param layoutView 要布局的试图
 @param size 子试图大小
 @param offset 子试图偏移量
 @param superView 父试图
 */
- (void)yb_center:(UIView *)layoutView size:(CGSize)size offset:(UIOffset)offset superView:(UIView *)superView {
    [self yb_center:layoutView offset:offset superView:superView];
    [layoutView yb_size:size];
}

/**
 中间布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param size 子试图大小
 @param offset 子试图偏移量
 */
- (void)yb_center:(UIView *)layoutView size:(CGSize)size offset:(UIOffset)offset {
    [self yb_center:layoutView offset:offset superView:nil];
    [layoutView yb_size:size];
}

/**
 中间布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param size 子试图大小
 */
- (void)yb_center:(UIView *)layoutView size:(CGSize)size {
    [self yb_center:layoutView offset:UIOffsetZero superView:nil];
    [layoutView yb_size:size];
}

#pragma mark - 内部布局
/**
 内部试图布局(self指的是参照试图)

 @param layoutView 要布局的试图
 @param duration 布局位置
 @param offset 偏移量
 @param superView 父试图
 */
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration offset:(UIOffset)offset superView:(UIView *)superView {
    UIView *sView = [self getSuperWithLayoutView:layoutView superView:superView];
    switch (duration) {
        case YBLayoutInLeftTop:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            break;
        case YBLayoutInLeftCenter:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterY toItem:self attribute:NSLayoutAttributeCenterY constant:offset.vertical layoutTypr:YBLayoutTypeCenterY]];
            break;
        case YBLayoutInLeftBottom:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            break;
        case YBLayoutInCenterTop:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterX toItem:self attribute:NSLayoutAttributeCenterX constant:offset.horizontal layoutTypr:YBLayoutTypeCenterX]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            break;
        case YBLayoutInCenterCenter:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterX toItem:self attribute:NSLayoutAttributeCenterX constant:offset.horizontal layoutTypr:YBLayoutTypeCenterX]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterY toItem:self attribute:NSLayoutAttributeCenterY constant:offset.vertical layoutTypr:YBLayoutTypeCenterY]];
            break;
        case YBLayoutInCenterBottom:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterX toItem:self attribute:NSLayoutAttributeCenterX constant:offset.horizontal layoutTypr:YBLayoutTypeCenterX]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            break;
        case YBLayoutInRightTop:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            break;
        case YBLayoutInRightCenter:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterY toItem:self attribute:NSLayoutAttributeCenterY constant:offset.vertical layoutTypr:YBLayoutTypeCenterY]];
            break;
        case YBLayoutInRightBottom:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            break;
    }
}

/**
 内部试图布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param offset 偏移量
 */
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration offset:(UIOffset)offset{
    [self yb_in:layoutView duration:duration offset:offset superView:nil];
}

/**
 内部试图布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 */
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration{
    [self yb_in:layoutView duration:duration offset:UIOffsetZero superView:nil];
}

/**
 内部试图布局(self指的是参照试图)

 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 @param offset 偏移量
 @param superView 父试图
 */
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset superView:(UIView *)superView {
    [self yb_in:layoutView duration:duration offset:offset superView:superView];
    [layoutView yb_size:size];
}

/**
 内部试图布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 @param offset 偏移量
 */
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset {
    [self yb_in:layoutView duration:duration size:size offset:offset superView:nil];
}

/**
 内部试图布局(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 */
- (void)yb_in:(UIView *)layoutView duration:(YBLayoutIn)duration size:(CGSize)size {
    [self yb_in:layoutView duration:duration size:size offset:UIOffsetZero superView:nil];
}

#pragma mark - 外部布局


/**
 外部布局子试图(self指的是参照试图)

 @param layoutView 要布局的试图
 @param duration 布局位置
 @param offset 偏移量
 @param superView 父试图
 */
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration offset:(UIOffset)offset superView:(UIView *)superView {
    UIView *sView = [self getSuperWithLayoutView:layoutView superView:superView];
    switch (duration) {
        case YBLayoutOutAngleLeftTop:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            break;
        case YBLayoutOutAngleRightTop:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            break;
        case YBLayoutOutAngleLeftBottom:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            break;
        case YBLayoutOutAngleRightBottom:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            break;
        case YBLayoutOutTopLeft:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            break;
        case YBLayoutOutTopCenter:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterX toItem:self attribute:NSLayoutAttributeCenterX constant:offset.horizontal layoutTypr:YBLayoutTypeCenterX]];
            break;
        case YBLayoutOutTopRight:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            break;
        case YBLayoutOutLeftTop:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            break;
        case YBLayoutOutLeftCenter:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterY toItem:self attribute:NSLayoutAttributeCenterY constant:offset.vertical layoutTypr:YBLayoutTypeCenterY]];
            break;
        case YBLayoutOutLeftBottom:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            break;
        case YBLayoutOutRightTop:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeTop constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            break;
        case YBLayoutOutRightCenter:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterY toItem:self attribute:NSLayoutAttributeCenterY constant:offset.vertical layoutTypr:YBLayoutTypeCenterY]];
            break;
        case YBLayoutOutRightBottom:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeBottom toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeBottom]];
            break;
        case YBLayoutOutBottomLeft:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeLeft toItem:self attribute:NSLayoutAttributeLeft constant:offset.horizontal layoutTypr:YBLayoutTypeLeft]];
            break;
        case YBLayoutOutBottomCenter:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeCenterX toItem:self attribute:NSLayoutAttributeCenterX constant:offset.horizontal layoutTypr:YBLayoutTypeCenterX]];
            break;
        case YBLayoutOutBottomRight:
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeTop toItem:self attribute:NSLayoutAttributeBottom constant:offset.vertical layoutTypr:YBLayoutTypeTop]];
            [sView addConstraint:[YBLayoutConstraint constraintWithItem:layoutView attribute:NSLayoutAttributeRight toItem:self attribute:NSLayoutAttributeRight constant:offset.horizontal layoutTypr:YBLayoutTypeRight]];
            break;
    }
}

/**
 外部布局子试图(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param offset 偏移量
 */
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration offset:(UIOffset)offset{
    [self yb_out:layoutView duration:duration offset:offset superView:nil];
}

/**
 外部布局子试图(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 */
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration{
    [self yb_out:layoutView duration:duration offset:UIOffsetZero superView:nil];
}


/**
 外部布局子试图(self指的是参照试图)

 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 @param offset 偏移量
 @param superView 父试图
 */
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset superView:(UIView *)superView {
    [self yb_out:layoutView duration:duration offset:offset superView:superView];
    [layoutView yb_size:size];
}

/**
 外部布局子试图(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 @param offset 偏移量
 */
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset {
    [self yb_out:layoutView duration:duration size:size offset:offset superView:nil];
}

/**
 外部布局子试图(self指的是参照试图)
 
 @param layoutView 要布局的试图
 @param duration 布局位置
 @param size 大小
 */
- (void)yb_out:(UIView *)layoutView duration:(YBLayoutOut)duration size:(CGSize)size {
    [self yb_out:layoutView duration:duration size:size offset:UIOffsetZero superView:nil];
}

#pragma mark - 添加试图
/**
 获取父试图(self指的是参照试图)

 @param layoutView 要布局的试图
 @param superView 父试图
 @return 返回要真正的父试图
 */
- (UIView *)getSuperWithLayoutView:(UIView *)layoutView superView:(UIView *)superView {
    layoutView.translatesAutoresizingMaskIntoConstraints = NO;
    if (layoutView.superview) {
        return layoutView.superview;
    }
    if (superView) {
        [superView addSubview:layoutView];
    }
    [self addSubview:layoutView];
    return layoutView.superview;
}

#pragma mark - 约束

/**
 获取指定的约束(self指的是需要布局的试图)

 @param layoutType 约束类型
 @return 返回自定义的约束
 */
- (YBLayoutConstraint *)constraintWithType:(YBLayoutType)layoutType {
    for (YBLayoutConstraint * obj in self.superview.constraints) {
        if (obj.firstItem == self) {
            if ([obj isKindOfClass:[YBLayoutConstraint class]] && obj.layoutType == layoutType) {
                return obj;
            }
        }
    }
    if (layoutType == YBLayoutTypeWidth) {
        YBLayoutConstraint *layoutConstraint = [YBLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth toItem:nil attribute:NSLayoutAttributeWidth constant:self.frame.size.width layoutTypr:YBLayoutTypeWidth];
        [self.superview addConstraint:layoutConstraint];
        return layoutConstraint;
    }
    if (layoutType == YBLayoutTypeHeight) {
        YBLayoutConstraint *layoutConstraint = [YBLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight toItem:nil attribute:NSLayoutAttributeHeight constant:self.frame.size.height layoutTypr:YBLayoutTypeHeight];
        [self.superview addConstraint: layoutConstraint];
        return layoutConstraint;
    }
    NSAssert(NO, @"没有找到制定约束");
    return nil;
}


/**
 设置指定约束(self指的是需要布局的试图)

 @param layoutType 约束类型
 @param constant 约束值
 */
- (void)setConstraintWithType:(YBLayoutType)layoutType constant:(CGFloat)constant {
    YBLayoutConstraint *layoutConstraint = [self constraintWithType:layoutType];
    layoutConstraint.constant = constant;
}


@end
