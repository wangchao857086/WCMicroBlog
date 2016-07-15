//
//  MBAccountManager.h
//  WCMicroBlog
//
//  Created by 王超 on 16/6/21.
//  Copyright © 2016年 王超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBAccount.h"
@interface MBAccountManager : NSObject
+ (void)saveAccount:(MBAccount *)account;
+ (MBAccount *)getAccount;
@end
