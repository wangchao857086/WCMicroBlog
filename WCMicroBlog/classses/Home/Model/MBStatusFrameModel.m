//
//  MBStatusFrameModel.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//  一个frame包括一个cell内部所有子空间的frame数据和显示数据

#import "MBStatusFrameModel.h"
#import "MBStatusOriginalFrame.h"
#import "MBStatusReweetedFrame.h"
#import "MBStatusDetailFrame.h"
@implementation MBStatusFrameModel
- (void)setStatus:(StatusModel *)status
{
    _status = status;
    
    //计算原创微博
//    [self setUpOriginalFrame];
//    //计算转发微博
//    [self setUpReweetedFrame];
    //计算微博具体内容
    [self setUpDetailFrame];
    //底部工具条
    [self setUpToolBarFrame];
    //计算cell的高度
    
}
//- (void)setUpOriginalFrame
//{
//    self.originalFrame = [[MBStatusOriginalFrame alloc]init];
//    self.originalFrame.status = self.status;
//}
//- (void)setUpReweetedFrame
//{
//    if (self.status.retweeted_status) {
//        <#statements#>
//    }
//}
- (void)setUpDetailFrame
{
    self.detailFrame = [[MBStatusDetailFrame alloc]init];
    self.detailFrame.status = self.status;
}
- (void)setUpToolBarFrame
{
    
}
@end
