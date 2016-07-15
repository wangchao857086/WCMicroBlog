//
//  WCSearchBar.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/20.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "WCSearchBar.h"

@implementation WCSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.placeholder = @"hahhaha请输入搜索条件";
        //设置背景
        self.background = [UIImage resizeWithImageName:@"searchbar_textfield_background"];
        UIImageView * image = [[UIImageView alloc]init];
        //设置搜索图片
        image.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        image.width = self.height;
        image.height = self.height;
        image.contentMode = UIViewContentModeCenter;
        self.leftView = image;
        self.leftViewMode = UITextFieldViewModeAlways;
        //    searchBar.textAlignment = NSTextAlignmentCenter;
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.clearButtonMode = UITextFieldViewModeAlways;
    }
    return self;
}
+ (instancetype)searchBar
{
    return [[self alloc]init];
}

@end
