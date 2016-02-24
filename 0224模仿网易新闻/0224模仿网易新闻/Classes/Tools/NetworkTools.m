//
//  NetworkTools.m
//  0224模仿网易新闻
//
//  Created by 王庆岩 on 16/2/24.
//  Copyright © 2016年 王庆岩. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+(instancetype)sharedNetworkTools{
    static NetworkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 注意url最后要加一个"/",否则会出问题
        // 这是最主要访问的网站地址,如果请求地址有变化,直接把新地址的全路径写上即可
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/nc/article/headline/"];
        instance = [[self alloc] initWithBaseURL:url];
        
        // json的解析格式,这是最全的,最能防止出错的..默认只有三种..
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                           @"text/json",
                           @"text/javascript",
                           @"text/html", nil];
    });
    return instance;
}


@end
