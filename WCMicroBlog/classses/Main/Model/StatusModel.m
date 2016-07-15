//
//  StatusModel.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/22.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "StatusModel.h"
#import "MBPhotoModel.h"
@implementation StatusModel
- (NSDictionary *)mj_objectClassInArray
{
    return @{@"pic_urls": [MBPhotoModel class]};
}
@end
