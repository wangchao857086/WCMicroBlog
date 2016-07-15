//
//  MBStatusDetailFrame.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBStatusDetailFrame.h"
#import "MBStatusOriginalFrame.h"
#import "MBStatusReweetedFrame.h"
@implementation MBStatusDetailFrame
- (void)setStatus:(StatusModel *)status
{
    _status = status;
    //计算原创微博的frame
    MBStatusOriginalFrame *original = [[MBStatusOriginalFrame alloc]init];
    original.status = status;
    self.originalFrame = original;
    //计算转载微博的frame
    MBStatusReweetedFrame *reweeted = [[MBStatusReweetedFrame alloc]init];
    reweeted.reweetStatus = status;
    self.reweetedFrame = reweeted;
}
@end
