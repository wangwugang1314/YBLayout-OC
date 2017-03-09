//
//  YBLayoutController05.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/8.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutController05.h"

@interface YBLayoutController05 ()

@end

@implementation YBLayoutController05

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.view0];
    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];
    [self.view addSubview:self.view4];
    [self.view addSubview:self.view5];
    [self.view addSubview:self.view6];
    [self.view addSubview:self.view7];
    [self.view addSubview:self.view8];
    [self.view addSubview:self.view9];
    [self.view addSubview:self.view10];
    [self.view addSubview:self.view11];
    [self.view addSubview:self.view12];
    [self.view addSubview:self.view13];
    [self.view addSubview:self.view14];
    [self.view addSubview:self.view15];
    
    [self.referenceView yb_out:self.view0 duration:YBLayoutOutTopLeft size:CGSizeMake(30, 30) offset:UIOffsetMake(10, 20) superView:nil];
    [self.referenceView yb_out:self.view1 duration:YBLayoutOutTopCenter size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view2 duration:YBLayoutOutTopRight size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view3 duration:YBLayoutOutBottomLeft size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view4 duration:YBLayoutOutBottomCenter size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view5 duration:YBLayoutOutBottomRight size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view6 duration:YBLayoutOutLeftTop size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view7 duration:YBLayoutOutLeftCenter size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view8 duration:YBLayoutOutLeftBottom size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view9 duration:YBLayoutOutRightTop size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view10 duration:YBLayoutOutRightCenter size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view11 duration:YBLayoutOutRightBottom size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view12 duration:YBLayoutOutAngleLeftTop size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view13 duration:YBLayoutOutAngleLeftBottom size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view14 duration:YBLayoutOutAngleRightTop size:CGSizeMake(30, 30) offset:UIOffsetZero];
    [self.referenceView yb_out:self.view15 duration:YBLayoutOutAngleRightBottom size:CGSizeMake(30, 30) offset:UIOffsetZero];
}



@end
