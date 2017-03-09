//
//  YBLayoutController06.m
//  YBAutoLayout
//
//  Created by 王亚彬 on 2017/3/8.
//  Copyright © 2017年 王亚彬. All rights reserved.
//

#import "YBLayoutController06.h"

@interface YBLayoutController06 ()

@end

@implementation YBLayoutController06

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.referenceView yb_size:CGSizeMake(100, 100)];
}

@end
