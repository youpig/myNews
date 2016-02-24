//
//  News.h
//  0224模仿网易新闻
//
//  Created by 王庆岩 on 16/2/24.
//  Copyright © 2016年 王庆岩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  左侧配图地址
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  回帖数量
 */
@property (nonatomic, assign) int replyCount;

/**
 *  多图数组
 */
@property (nonatomic, strong) NSArray *imgextra;


+ (instancetype)newsWithDict:(NSDictionary *)dict;


+ (void)loadNewsListWithURLString:(NSString *)urlString finishied:(void (^)(NSArray *newsList))finishied;

@end
