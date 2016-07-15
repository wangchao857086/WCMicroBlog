//
//  NewFeatureViewController.m
//  WCMicroBlog
//
//  Created by 王超 on 16/4/27.
//  Copyright © 2016年 王超. All rights reserved.
//

#define NewFeatureImageCount 4

#import "NewFeatureViewController.h"
#import "MyTabBarController.h"
@interface NewFeatureViewController () <UIScrollViewDelegate>
@property (nonatomic,weak) UIPageControl * pageControl;
@end

@implementation NewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     WangChaoLog(@"NewFeatureViewController");
    [self addScrollView];
    
    [self addPageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}
/**
 *    添加scrollView
 */
- (void)addScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    //添加图片
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    for (int i = 0; i < NewFeatureImageCount; i++) {
        //创建imageView
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(imageW * i, 0, imageW, imageH);
        imageView.image = [UIImage imageNamed:@"new_feature_1"];
        [scrollView addSubview:imageView];
        if (i == NewFeatureImageCount-1) {
            
            UIButton * button = [[UIButton alloc]init];
            [button setBackgroundImage:[UIImage imageNamed:@"new_feature_button"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"new_feature_button_highlighted"] forState:UIControlStateHighlighted];
            
            button.size = button.currentBackgroundImage.size;
            button.x = (kScreen_Width-button.width)/2;
            button.y = kScreen_Height-150;
            [button addTarget:self action:@selector(enterMicroBlog:) forControlEvents:UIControlEventTouchUpInside];
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:button];
        }
    }
    //其他设置
    scrollView.contentSize = CGSizeMake(NewFeatureImageCount * imageW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.bounces = NO;
    scrollView.backgroundColor = WCColor(255, 255, 255);
}
- (void)addPageControl
{
    UIPageControl * pageControll = [[UIPageControl alloc]init];
    pageControll.numberOfPages = NewFeatureImageCount;
    pageControll.centerX = kScreen_Width*0.5;
    pageControll.centerY = kScreen_Height-30;
    [self.view addSubview:pageControll];
    //设置圆点的颜色
    pageControll.pageIndicatorTintColor = [UIColor grayColor];
    //当前页的圆点颜色
    pageControll.currentPageIndicatorTintColor = RED;
    self.pageControl = pageControll;
}
- (void)enterMicroBlog:(UIButton *)button
{
    NSLog(@"enterMicroBlog");
    MyTabBarController * tab = [[MyTabBarController alloc]init];
    //切换根视图控制器
    UIApplication * app = [UIApplication sharedApplication];
    app.keyWindow.rootViewController = tab;
}
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //拿到浮点型四舍五入
    CGFloat pageF = scrollView.contentOffset.x/kScreen_Width;
    int page = (int)(pageF+0.5);
//    WangChaoLog(@"%f",page);
    self.pageControl.currentPage = page;
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
