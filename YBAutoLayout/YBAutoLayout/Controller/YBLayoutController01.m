//
//  YBLayoutController01.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/8.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutController01.h"
#import "UIView+YBLayout.h"

@interface YBLayoutController01 ()

@end

@implementation YBLayoutController01

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.referenceView yb_fill:self.view0 edge:UIEdgeInsetsMake(10, 20, 30, 40)];
}


@end
