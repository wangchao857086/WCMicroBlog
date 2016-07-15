//
//  MBAccountManager.m
//  WCMicroBlog
//
//  Created by 王超 on 16/6/21.
//  Copyright © 2016年 王超. All rights reserved.
//

#import "MBAccountManager.h"
#import "MBAccount.h"
#define MBAccountFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]  stringByAppendingPathComponent:@"account.data"]
@implementation MBAccountManager
+ (void)saveAccount:(MBAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:MBAccountFilePath];
}
+ (MBAccount *)getAccount
{
    //解档
    MBAccount * account =  [NSKeyedUnarchiver unarchiveObjectWithFile:MBAccountFilePath];
    //判断账号是否过期
    NSDate * now = [NSDate date];
    NSDate * expires_time = account.expires_time;
    if ([now compare:expires_time] == NSOrderedDescending) {
        //过期了，重新获取
        account = nil;
    }
   
    return account;
}
@end
