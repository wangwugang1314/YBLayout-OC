//
//  YBLayoutController08.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/9.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutController08.h"

@interface YBLayoutController08 ()

@end

@implementation YBLayoutController08

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.referenceView yb_fill:self.view0 edge:UIEdgeInsetsMake(10, 20, 30, 40)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view0 setConstraintWithType:YBLayoutTypeTop constant:100];
}

@end
