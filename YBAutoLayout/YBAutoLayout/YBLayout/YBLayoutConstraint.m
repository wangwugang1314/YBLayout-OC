//
//  YBLayoutConstraint.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutConstraint.h"

@implementation YBLayoutConstraint

+ (instancetype)constraintWithItem:(UIView *)view1 attribute:(NSLayoutAttribute)attr1 toItem:(UIView *)view2 attribute:(NSLayoutAttribute)attr2 constant:(CGFloat)constant layoutTypr:(YBLayoutType)layoutType {
    YBLayoutConstraint *layoutConstraint = [YBLayoutConstraint constraintWithItem:view1 attribute:attr1 relatedBy:NSLayoutRelationEqual toItem:view2 attribute:attr2 multiplier:1 constant: constant];
    layoutConstraint.layoutType = layoutType;
    return layoutConstraint;
}

@end
