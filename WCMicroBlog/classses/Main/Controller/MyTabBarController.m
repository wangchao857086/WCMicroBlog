//
//  MyTabBarController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/15.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyNavigationController.h"
@interface MyTabBarController ()
{
    NSMutableArray *_viewControllers;
    NSMutableArray *_titles;
    NSMutableArray *_icons;
    NSMutableArray *_icons_selected;
}
@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取配置信息
    [self getConfigInfo];
    //设置子控制器
    [self setSubViewControllers];
    
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    for (UIView * view  in self.tabBar.subviews) {
        NSLog(@"%@",view.subviews);
        for (UIView * child in view.subviews) {
            if ([child isKindOfClass:NSClassFromString(@"UIBackdropView")]) {
                child.backgroundColor = RED;
            }
        }
    }
}
- (void)getConfigInfo{
    //初始化数组
    _titles = [[NSMutableArray alloc]init];
    _viewControllers = [[NSMutableArray alloc]init];
    _icons = [[NSMutableArray alloc]init];
    _icons_selected = [[NSMutableArray alloc]init];
    //读取plist文件
    NSString * pathStr = [[NSBundle mainBundle] pathForResource:@"Property" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:pathStr];
    for (NSDictionary * dic in array) {
        [_viewControllers addObject:dic[@"controller"]];
        [_titles addObject:dic[@"title"]];
        [_icons_selected addObject:dic[@"tabbar_h"]];
        [_icons addObject:dic[@"tabbar"]];
    }
}
- (void)setSubViewControllers{
    for (int i = 0; i < _titles.count; i++) {
        Class class = NSClassFromString(_viewControllers[i]);
        UIViewController * controller = [[class alloc]init];
        NSString * title = _titles[i];
        NSString * icon = _icons[i];
        NSString * icon_h = _icons_selected[i];
        [self addPerViewControllersWithTitle:title WithImage:icon WithSelectedImage:icon_h WithController:controller];
    }

}
- (void)addPerViewControllersWithTitle:(NSString *)title WithImage:(NSString *)image WithSelectedImage:(NSString *)selectedImage WithController:(UIViewController *)controller{
    controller.title = title;//导航栏和标签栏同时设置上
    UIImage * image_normal = [UIImage imageNamed:image];
    UIImage * image_selected = [UIImage imageNamed:selectedImage];
    image_selected = [image_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    image_normal = [image_normal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.image = image_normal;
    controller.tabBarItem.selectedImage = image_selected;
    MyNavigationController * nav = [[MyNavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
