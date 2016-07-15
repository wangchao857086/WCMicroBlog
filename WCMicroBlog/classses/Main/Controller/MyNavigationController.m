//
//  MyNavigationController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/15.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //拦截push操作
    
   }
/**
 *  当第一次使用这个类的时候，调用一次
 */
+ (void)initialize
{
    [self setBarButtonItemTheme];
//    [self setNavigationBarTheme];
    
}
+ (void)setNavigationBarTheme
{
    UINavigationBar * appearance = [UINavigationBar appearance];
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background_os7"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary * textAttri = @{NSForegroundColorAttributeName:[UIColor blackColor]};
   
    [appearance setTitleTextAttributes:textAttri];
}
+ (void)setBarButtonItemTheme
{
    //通过appearance设置所有的item的主题
    //通过appearance对象，设置所有的外观
    UIBarButtonItem * appearance = [UIBarButtonItem appearance];
    //设置普通文字状态的属性
    //    NSShadowAttributeName
    //    NSShadow * shadow = [[NSShadow alloc]init];
    //    shadow.shadowColor = [UIColor redColor];
    //    shadow.shadowOffset = CGSizeMake(2, 3);
    //    NSForegroundColorAttributeName
    NSDictionary * textAttri = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    [appearance setTitleTextAttributes:textAttri forState:UIControlStateNormal];
    
    NSDictionary * textAttriHigh = @{NSForegroundColorAttributeName:[UIColor redColor]};
    [appearance setTitleTextAttributes:textAttriHigh forState:UIControlStateHighlighted];
    NSDictionary * textAttriDisable = @{NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    [appearance setTitleTextAttributes:textAttriDisable forState:UIControlStateDisabled];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
   
}
//能拦截左右push进来的导航控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more@2x" WithHighlightImageName:@"navigationbar_more_highlighted@2x" target:self WithMethod:@selector(more)];
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back@2x" WithHighlightImageName:@"navigationbar_back_highlighted@2x" target:self WithMethod:@selector(back)];

    }
    [super pushViewController:viewController animated:animated];
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}
- (void)more
{
    [self popViewControllerAnimated:YES];
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
