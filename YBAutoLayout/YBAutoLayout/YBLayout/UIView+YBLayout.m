//
//  UIView+YBLayout_OC.m
//  YBXX-OC
//
//  Created by FuYun on 2016/12/12.
//  Copyright © 2016年 FuYun. All rights reserved.
//

#import "UIView+YBLayout.h"
#import "Masonry.h"

@implementation UIView (YBLayout_OC)

#pragma mark - 平铺俯视图(多个)
/**
 平铺俯视图(子试图在方法里面已经添加到父试图上面)

 @param views 子试图数组(个数必须大于1)
 @param interval 子试图的间隔
 @param duration 横向平铺还是纵向平铺
 @param edge 子试图与父试图的边缘
 */
- (void)yb_fill:(NSArray<UIView*>*)views interval:(CGFloat)interval duration:(YBLayoutDuration)duration edge:(UIEdgeInsets)edge {
    // 数组个数必须大于一个
    assert(views.count > 1);
    [views enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addSubview:obj];
        if(duration == YBLayoutDurationHorizon) {
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                if (idx == 0) {
                    make.left.mas_equalTo(self.mas_left).offset(edge.left);
                } else if (idx == views.count - 1) {
                    make.right.mas_equalTo(self.mas_right).offset(-edge.right);
                    make.left.mas_equalTo(views[idx - 1].mas_right).offset(interval);
                    make.width.mas_equalTo(views.firstObject);
                } else {
                    make.left.mas_equalTo(views[idx - 1].mas_right).offset(interval);
                    make.width.mas_equalTo(views.firstObject);
                }
                make.top.mas_equalTo(self.mas_top).offset(edge.top);
                make.bottom.mas_equalTo(self.mas_bottom).offset(-edge.bottom);
            }];
        }else{
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                if (idx == 0) {
                    make.top.mas_equalTo(self.mas_top).offset(edge.top);
                } else if (idx == views.count - 1) {
                    make.bottom.mas_equalTo(self.mas_bottom).offset(-edge.bottom);
                    make.top.mas_equalTo(views[idx - 1].mas_bottom).offset(interval);
                    make.height.mas_equalTo(views.firstObject);
                } else {
                    make.top.mas_equalTo(views[idx - 1].mas_bottom).offset(interval);
                    make.height.mas_equalTo(views.firstObject);
                }
                make.left.mas_equalTo(self.mas_left).offset(edge.left);
                make.right.mas_equalTo(self.mas_right).offset(-edge.right);
            }];
        }
    }];
}

#pragma mark - 平铺俯视图(单个)
/**
 平铺俯视图 (单个子试图)

 @param view 子试图
 @param edge 边距
 @param isAdd 是否需要添加到俯视图
 */
- (void)yb_fill:(UIView *)view edge:(UIEdgeInsets)edge isAdd:(BOOL)isAdd {
    if (isAdd) {
        [self addSubview:view];
    }
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(edge);
    }];
}

#pragma mark - 设置试图的大小
/**
 设置试图的大小

 @param size 试图大小
 */
- (void)yb_size:(CGSize)size {
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(size);
    }];
}

#pragma mark - 中间布局
/**
 中间布局

 @param view 子试图
 @param offset 子试图偏移量
 @param isAdd 是否添加
 */
- (void)yb_center:(UIView *)view offset:(UIOffset)offset isAdd:(BOOL)isAdd {
    if (isAdd) {
        [self addSubview:view];
    }
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(offset.horizontal);
        make.centerY.mas_equalTo(offset.vertical);
    }];
}


/**
 中间布局(默认添加上了)

 @param view 子试图
 @param offset 子试图偏移量
 */
- (void)yb_center:(UIView *)view offset:(UIOffset)offset{
    [self yb_center:view offset:offset isAdd:YES];
}

/**
 中间布局(默认添加上了)
 
 @param view 子试图
 */
- (void)yb_center:(UIView *)view{
    [self yb_center:view offset:UIOffsetZero isAdd:YES];
}

/**
 中间布局

 @param view 子试图
 @param size 子试图大小
 @param offset 子试图偏移量
 @param isAdd 是否添加
 */
- (void)yb_center:(UIView *)view size:(CGSize)size offset:(UIOffset)offset isAdd:(BOOL)isAdd {
    [self yb_center:view offset:offset isAdd:isAdd];
    [view yb_size:size];
}

/**
 中间布局(默认添加)
 
 @param view 子试图
 @param size 子试图大小
 @param offset 子试图偏移量
 */
- (void)yb_center:(UIView *)view size:(CGSize)size offset:(UIOffset)offset {
    [self yb_center:view offset:offset isAdd:YES];
    [view yb_size:size];
}

/**
 中间布局(默认添加)
 
 @param view 子试图
 @param size 子试图大小
 */
- (void)yb_center:(UIView *)view size:(CGSize)size {
    [self yb_center:view offset:UIOffsetZero isAdd:YES];
    [view yb_size:size];
}

#pragma mark - 内部布局
/**
 内部试图布局

 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration offset:(UIOffset)offset isAdd:(BOOL)isAdd {
    if (isAdd) {
        [self addSubview:view];
    }
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        switch (duration) {
            case YBLayoutInLeftTop:
                make.left.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.top.mas_equalTo(self.mas_top).offset(offset.vertical);
                break;
            case YBLayoutInLeftCenter:
                make.left.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.centerY.mas_equalTo(self.mas_centerY).offset(offset.vertical);
                break;
            case YBLayoutInLeftBottom:
                make.left.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.bottom.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                break;
            case YBLayoutInCenterTop:
                make.centerX.mas_equalTo(self.mas_centerX).offset(offset.horizontal);
                make.top.mas_equalTo(self.mas_top).offset(offset.vertical);
                break;
            case YBLayoutInCenterCenter:
                make.centerX.mas_equalTo(self.mas_centerX).offset(offset.horizontal);
                make.centerY.mas_equalTo(self.mas_centerY).offset(offset.vertical);
                break;
            case YBLayoutInCenterBottom:
                make.centerX.mas_equalTo(self.mas_centerX).offset(offset.horizontal);
                make.bottom.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                break;
            case YBLayoutInRightTop:
                make.right.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.top.mas_equalTo(self.mas_top).offset(offset.vertical);
                break;
            case YBLayoutInRightCenter:
                make.right.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.centerY.mas_equalTo(self.mas_centerY).offset(offset.vertical);
                break;
            case YBLayoutInRightBottom:
                make.right.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.bottom.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                break;
        }
    }];
}

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param offset 偏移量
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration offset:(UIOffset)offset{
    [self yb_in:view duration:duration offset:offset isAdd:YES];
}

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration{
    [self yb_in:view duration:duration offset:UIOffsetZero isAdd:YES];
}

/**
 内部试图布局

 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param size 大小
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset isAdd:(BOOL)isAdd {
    [self yb_in:view duration:duration offset:offset isAdd:isAdd];
    [view yb_size:size];
}

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param size 大小
 @param offset 偏移量
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration size:(CGSize)size offset:(UIOffset)offset {
    [self yb_in:view duration:duration size:size offset:offset isAdd:YES];
}

/**
 内部试图布局
 
 @param view 子试图
 @param duration 子试图位于俯视图的方向
 @param size 大小
 */
- (void)yb_in:(UIView *)view duration:(YBLayoutIn)duration size:(CGSize)size {
    [self yb_in:view duration:duration size:size offset:UIOffsetZero isAdd:YES];
}

#pragma mark - 外部布局


/**
 外部布局子试图

 @param view 子试图
 @param duration 方向
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration offset:(UIOffset)offset isAdd:(BOOL)isAdd {
    if (isAdd) {
        [self addSubview:view];
    }
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        switch (duration) {
            case YBLayoutOutAngleLeftTop:
                make.right.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.bottom.mas_equalTo(self.mas_top).offset(offset.vertical);
                break;
            case YBLayoutOutAngleRightTop:
                make.left.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.bottom.mas_equalTo(self.mas_top).offset(offset.vertical);
                break;
            case YBLayoutOutAngleLeftBottom:
                make.right.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.top.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                break;
            case YBLayoutOutAngleRightBottom:
                make.left.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.top.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                break;
            case YBLayoutOutTopLeft:
                make.bottom.mas_equalTo(self.mas_top).offset(offset.vertical);
                make.left.mas_equalTo(self.mas_left).offset(offset.horizontal);
                break;
            case YBLayoutOutTopCenter:
                make.bottom.mas_equalTo(self.mas_top).offset(offset.vertical);
                make.centerX.mas_equalTo(self.mas_centerX).offset(offset.horizontal);
                break;
            case YBLayoutOutTopRight:
                make.bottom.mas_equalTo(self.mas_top).offset(offset.vertical);
                make.right.mas_equalTo(self.mas_right).offset(offset.horizontal);
                break;
            case YBLayoutOutLeftTop:
                make.right.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.top.mas_equalTo(self.mas_top).offset(offset.vertical);
                break;
            case YBLayoutOutLeftCenter:
                make.right.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.centerY.mas_equalTo(self.mas_centerY).offset(offset.vertical);
                break;
            case YBLayoutOutLeftBottom:
                make.right.mas_equalTo(self.mas_left).offset(offset.horizontal);
                make.bottom.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                break;
            case YBLayoutOutRightTop:
                make.left.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.top.mas_equalTo(self.mas_top).offset(offset.vertical);
                break;
            case YBLayoutOutRightCenter:
                make.left.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.centerY.mas_equalTo(self.mas_centerY).offset(offset.vertical);
                break;
            case YBLayoutOutRightBottom:
                make.left.mas_equalTo(self.mas_right).offset(offset.horizontal);
                make.bottom.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                break;
            case YBLayoutOutBottomLeft:
                make.top.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                make.left.mas_equalTo(self.mas_left).offset(offset.horizontal);
                break;
            case YBLayoutOutBottomCenter:
                make.top.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                make.centerX.mas_equalTo(self.mas_centerX).offset(offset.horizontal);
                break;
            case YBLayoutOutBottomRight:
                make.top.mas_equalTo(self.mas_bottom).offset(offset.vertical);
                make.right.mas_equalTo(self.mas_right).offset(offset.horizontal);
                break;
        }
    }];
}

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param offset 偏移量
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration offset:(UIOffset)offset{
    [self yb_out:view duration:duration offset:offset isAdd:YES];
}

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration{
    [self yb_out:view duration:duration offset:UIOffsetZero isAdd:YES];
}


/**
 外部布局子试图

 @param view 子试图
 @param duration 方向
 @param size 大小
 @param offset 偏移量
 @param isAdd 是否添加
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset isAdd:(BOOL)isAdd {
    [self yb_out:view duration:duration offset:offset isAdd:isAdd];
    [view yb_size:size];
}

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param size 大小
 @param offset 偏移量
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration size:(CGSize)size offset:(UIOffset)offset {
    [self yb_out:view duration:duration offset:offset isAdd:YES];
    [view yb_size:size];
}

/**
 外部布局子试图
 
 @param view 子试图
 @param duration 方向
 @param size 大小
 */
- (void)yb_out:(UIView *)view duration:(YBLayoutOut)duration size:(CGSize)size {
    [self yb_out:view duration:duration offset:UIOffsetZero isAdd:YES];
    [view yb_size:size];
}

@end
