//
//  MBStatusOriginalView.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBStatusOriginalView.h"

@interface MBStatusOriginalView()
@property (nonatomic,weak) UILabel * nameLabel;
@property (nonatomic,weak) UILabel * textLabel;
@property (nonatomic,weak) UILabel * timeLabel;
@property (nonatomic,weak) UILabel * sourceLabel;
@property (nonatomic,weak) UIImageView * iconView;
@end
@implementation MBStatusOriginalView

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
        //昵称
        UILabel * nameLabel  = [[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //正文
        UILabel * textLabel = [[UILabel alloc]init];
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        //时间
        UILabel * timeLabel  = [[UILabel alloc]init];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        //来源
        UILabel * sourceLabel = [[UILabel alloc]init];
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        //头像
        UIImageView * iconView = [[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
    }
    return self;
}
@end
