//
//  YBLayoutController03.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/8.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutController03.h"

@implementation YBLayoutController03

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.referenceView yb_fill:@[self.view0, self.view1, self.view2] duration:YBLayoutDurationVertical interval:10 edge:UIEdgeInsetsMake(10, 20, 30, 40) superview:nil];
}

@end
