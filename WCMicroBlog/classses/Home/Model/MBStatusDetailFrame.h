//
//  MBStatusDetailFrame.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/23.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StatusModel,MBStatusOriginalFrame,MBStatusReweetedFrame;
@interface MBStatusDetailFrame : NSObject
@property (nonatomic,strong) MBStatusOriginalFrame *originalFrame;
@property (nonatomic,strong) MBStatusReweetedFrame *reweetedFrame ;
//自己的frame
@property (nonatomic,assign) CGRect frame;
@property (nonatomic,strong) StatusModel * status;
@end
