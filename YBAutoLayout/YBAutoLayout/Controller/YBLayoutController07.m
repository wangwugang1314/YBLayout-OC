//
//  YBLayoutController07.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutController07.h"

@interface YBLayoutController07 ()

@end

@implementation YBLayoutController07

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.referenceView yb_center:self.view0 size:CGSizeMake(100, 100) offset:UIOffsetMake(30, 30)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", [self.view0 constraintWithType:YBLayoutTypeCenterX]);
}


@end
