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
        instance = [nsurl ]
    });

}


@end
