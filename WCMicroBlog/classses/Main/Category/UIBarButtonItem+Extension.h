//
//  UIBarButtonItem+Extension.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/16.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName WithHighlightImageName:(NSString *)highlightImageName target:(id)target WithMethod:(SEL)action;
@end
