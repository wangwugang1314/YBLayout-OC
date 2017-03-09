//
//  YBLayoutController04.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/8.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutController04.h"

@interface YBLayoutController04 ()

@end

@implementation YBLayoutController04

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.referenceView yb_in:self.view0 duration:YBLayoutInLeftTop size:CGSizeMake(30, 30) offset:UIOffsetMake(10, 10)];
    [self.referenceView yb_in:self.view1 duration:YBLayoutInLeftCenter size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_in:self.view2 duration:YBLayoutInLeftBottom size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_in:self.view3 duration:YBLayoutInCenterTop size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_in:self.view4 duration:YBLayoutInCenterCenter size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_in:self.view5 duration:YBLayoutInCenterBottom size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_in:self.view6 duration:YBLayoutInRightTop size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_in:self.view7 duration:YBLayoutInRightCenter size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_in:self.view8 duration:YBLayoutInRightBottom size:CGSizeMake(30, 30) offset:UIOffsetZero];
}



@end
