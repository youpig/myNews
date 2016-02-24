//
//  NetworkTools.h
//  0224模仿网易新闻
//
//  Created by 王庆岩 on 16/2/24.
//  Copyright © 2016年 王庆岩. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NetworkTools : AFHTTPSessionManager

/**
 *  全局的网络访问入口
 *
 */
+ (instancetype)sharedNetworkTools;



@end
