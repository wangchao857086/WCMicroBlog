//
//  WCControllerTool.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/27.
//  Copyright © 2016年 王超. All rights reserved.
//  负责控制器相关的操作

#import "WCControllerTool.h"
#import "NewFeatureViewController.h"
#import "MyTabBarController.h"
#define VERSION_KEY @"lastVersion"
@implementation WCControllerTool
+ (void)chooseRootViewController
{
    /**
     *  新特性代码
     */
    //从沙盒中取出上次存储的版本号，不用关心文件的位置
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * lastVersion = [defaults objectForKey:VERSION_KEY];
    //获得当前的版本号
    //    WangChaoLog(@"%@", [NSBundle mainBundle].infoDictionary);
    //    NSString * currentVersion = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleVersion"];
    NSString * currentVersion = [[NSBundle mainBundle].infoDictionary objectForKey:(__bridge NSString *)kCFBundleVersionKey];
    
    /**
     * Foundation      NSStirng/NSArray/NSDictionary
     CoreFoundation CFStringRef...
     可以相互转换，必须用桥接  __bridge进行桥接
     CFStringRef string = (__bridge CFStringRef)(@"haha");
     */
    
    //字符串不一样就是新版本
    UIViewController * rootVC;
    if ([currentVersion isEqualToString:lastVersion]) {
        // //设置根控制器
        rootVC = [[MyTabBarController alloc]init];
        //WCOAuthViewController *tabVC = [[WCOAuthViewController alloc]init];
        
    }
    else{
        //设置根控制器
        rootVC = [[NewFeatureViewController alloc]init];
        //WCOAuthViewController *tabVC = [[WCOAuthViewController alloc]init];
        [defaults setObject:currentVersion forKey:VERSION_KEY];
        [defaults synchronize];//立刻更改物理文件马上同步到沙盒中
    }
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = rootVC;

 
}
@end
