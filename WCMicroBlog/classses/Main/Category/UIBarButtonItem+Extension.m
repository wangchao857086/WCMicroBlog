//
//  UIBarButtonItem+Extension.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/16.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName WithHighlightImageName:(NSString *)highlightImageName target:(id)target WithMethod:(SEL)action
{
    UIButton * button = [[UIButton alloc]init];
    UIImage * rightImage = [UIImage imageNamed:imageName];
    UIImage * rightHighImage = [UIImage imageNamed:highlightImageName];
    [button setBackgroundImage:rightImage forState:UIControlStateNormal];
    [button setBackgroundImage:rightHighImage forState:UIControlStateHighlighted];
    //设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    //    leftButton.currentImage  好坑啊，应该是背景图片
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
}
@end
