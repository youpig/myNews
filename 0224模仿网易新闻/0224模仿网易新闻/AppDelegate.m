//
//  AppDelegate.m
//  0224模仿网易新闻
//
//  Created by 王庆岩 on 16/2/24.
//  Copyright © 2016年 王庆岩. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 设置缓存..官方默认的写法
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:cache];
    
    // 设置网络指示器...必须用尖括号..导入一个单独的头文件..是AFN对UIKit的扩展
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    
    return YES;
}



@end
