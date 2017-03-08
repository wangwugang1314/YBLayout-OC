/*
 with 与 and 其实什么都没做可以省略
 相等可以全部写 mas_equalTo
 mas_centerY 写在后面 centerY 写在前面
 
 中心点相同(X,Y)
    make.center.mas_equalTo(self.view);
 中心点相同(Y)
    make.centerY.mas_equalTo(self.view.mas_centerY);
    make.centerY.mas_equalTo(@[sv12,sv13]);
 ----------------------------------
 设置一个边距(make顶部Y值等于view顶部Y值加10)
    make.top.mas_equalTo(view).offset(10);
 设置一个边距(make右边X值等于view左边Y值减10)
    make.right.mas_equalTo(view.mas_left).offset(-10);
 ----------------------------------
 设置大小(H,W)
    make.size.mas_equalTo(CGSizeMake(300, 300));
    make.size.mas_equalTo(self.view);
 设置大小(H)
    make.height.mas_equalTo(@150);
 设置大小(与指定试图的指定边长相同)
    make.width.mas_equalTo(self.view);
    make.width.mas_equalTo(view.mas_width); 三句效果一样
    make.left.and.right.mas_equalTo(view);
 ----------------------------------
 设置四个边距（与父视图的边距距离）
    make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    make.top.left.bottom.right.mas_equalTo(sv).insets(UIEdgeInsetsMake(10, 10, 10, 10));
 ----------------------------------
 设置两个视图相等
    make.edges.mas_equalTo(scrollView);
 
举例：
 // 创建约束
 [self.lightView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.size.mas_equalTo(CGSizeMake(180, 82));
    make.centerX.mas_equalTo(self.view.mas_centerX);
    make.centerY.mas_equalTo(self.view.mas_top).offset(100);
 }];
 
 // 改造约束（会把之前的所有约束删除）
 mas_remakeConstraints
 
 // 更新约束（只会更新指定的约束）
 mas_updateConstraints
 */