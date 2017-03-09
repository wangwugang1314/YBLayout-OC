//
//  YBBaseController.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/8.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBBaseController.h"
#import "YBView.h"

#define YBRandamColor [UIColor colorWithRed:arc4random_uniform(256)/ 255.0f green:arc4random_uniform(256)/ 255.0f blue:arc4random_uniform(256)/ 255.0f alpha:1.0];

@interface YBBaseController ()

@end

@implementation YBBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.referenceView = [YBView new];
    self.referenceView.backgroundColor = [UIColor grayColor];
    
    self.view0 = [YBView new];
    self.view0.backgroundColor = YBRandamColor
    
    self.view1 = [YBView new];
    self.view1.backgroundColor = YBRandamColor
    
    self.view2 = [YBView new];
    self.view2.backgroundColor = YBRandamColor
    
    self.view3 = [YBView new];
    self.view3.backgroundColor = YBRandamColor
    
    self.view4 = [YBView new];
    self.view4.backgroundColor = YBRandamColor
    
    self.view5 = [YBView new];
    self.view5.backgroundColor = YBRandamColor
    
    self.view6 = [YBView new];
    self.view6.backgroundColor = YBRandamColor
    
    self.view7 = [YBView new];
    self.view7.backgroundColor = YBRandamColor
    
    self.view8 = [YBView new];
    self.view8.backgroundColor = YBRandamColor
    
    self.view9 = [YBView new];
    self.view9.backgroundColor = YBRandamColor
    
    self.view10 = [YBView new];
    self.view10.backgroundColor = YBRandamColor
    
    self.view11 = [YBView new];
    self.view11.backgroundColor = YBRandamColor
    
    self.view12 = [YBView new];
    self.view12.backgroundColor = YBRandamColor
    
    self.view13 = [YBView new];
    self.view13.backgroundColor = YBRandamColor
    
    self.view14 = [YBView new];
    self.view14.backgroundColor = YBRandamColor
    
    self.view15 = [YBView new];
    self.view15.backgroundColor = YBRandamColor
    
    [self.view yb_center:self.referenceView size:CGSizeMake(200, 200) offset:UIOffsetZero];
}

@end
