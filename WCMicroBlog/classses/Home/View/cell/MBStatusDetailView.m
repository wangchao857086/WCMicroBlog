//
//  MBStatusDetailView.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBStatusDetailView.h"
#import "MBStatusOriginalView.h"
#import "MBStatusReweetView.h"
@interface MBStatusDetailView()
@property (nonatomic,weak) MBStatusOriginalView * originalView;
@property (nonatomic,weak) MBStatusReweetView * reweetedView;
@end
@implementation MBStatusDetailView

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
        [self setUpOriginalView];
         [self setUpReweetedView];
    }
    return self;
}
- (void)setUpOriginalView
{
    MBStatusOriginalView * view = [[MBStatusOriginalView alloc]init];
    self.originalView = view;
    [self addSubview:view];
}
- (void)setUpReweetedView
{
    MBStatusReweetView * view = [[MBStatusReweetView alloc]init];
    self.reweetedView = view;
    [self addSubview:view];
}
@end
