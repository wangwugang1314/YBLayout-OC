//
//  YBLayoutConstraint.h
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 约束类型
 */
typedef NS_ENUM(NSInteger, YBLayoutType) {
    YBLayoutTypeTop,
    YBLayoutTypeLeft,
    YBLayoutTypeBottom,
    YBLayoutTypeRight,
    YBLayoutTypeWidth,
    YBLayoutTypeHeight,
    YBLayoutTypeCenterX,
    YBLayoutTypeCenterY
};

@interface YBLayoutConstraint : NSLayoutConstraint


/**
 约束类型
 */
@property(nonatomic, assign) YBLayoutType layoutType;

+ (instancetype)constraintWithItem:(UIView *)view1 attribute:(NSLayoutAttribute)attr1 toItem:(UIView *)view2 attribute:(NSLayoutAttribute)attr2 constant:(CGFloat)constant layoutTypr:(YBLayoutType)layoutType;

@end
