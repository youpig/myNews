//
//  News.m
//  0224模仿网易新闻
//
//  Created by 王庆岩 on 16/2/24.
//  Copyright © 2016年 王庆岩. All rights reserved.
//

#import "News.h"
#import "NetworkTools.h"
#import <objc/runtime.h>


@implementation News

+(instancetype)newsWithDict:(NSDictionary *)dict{

    id obj = [[self alloc] init];
    // 非常原始的方法,指定自己需要的key
//    NSArray *properties = @[@"title",@"digest",@"replyCount",@"imgsrc"];
    NSArray *properties = [self loadPropertis];
    for (NSString *key in properties) {
        if (dict[key] != nil) {
            [obj setValue:dict[key] forKeyPath:key];
        }
    }
//    [obj setValuesForKeysWithDictionary:dict];
    return obj;
}

const char *kProperties = "kProperties";
+ (NSArray *)loadPropertis{

    // 获取关联对象
    NSArray *pList = objc_getAssociatedObject(self, kProperties);
    if(pList != nil){
        return pList;
    }
    
    // 类的属性的个数
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    // 遍历数组
    for (unsigned int i=0; i<count; i++) {
        // 单个的属性
        objc_property_t pty = list[i];
        
        // 属性名称
        const char *cname = property_getName(pty);
        // 添加到数组
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
//        printf("%s/t",cname);
    }
//    printf("/n ");
    
    // 打印 属性的个数
    NSLog(@"%u", count);
    NSLog(@"%@", arrayM); 
    
    // 释放对象
    free(list);
    
    // 设置关联对象
    objc_setAssociatedObject(self, kProperties, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, kProperties);
//    return arrayM.copy;
}


-(NSString *)description{
    
    NSArray *array = [self.class loadPropertis];
    NSDictionary *dict = [self dictionaryWithValuesForKeys:array];
    
    return [NSString stringWithFormat:@"<%@ : %p> %@",self.class, self, dict];
}

+(void)loadNewsListWithURLString:(NSString *)urlString finishied:(void (^)(NSArray *))finishied{
    //断言如何使用呢???
    NSAssert(finishied != nil, @"必须传入完成回调");
    
    [[NetworkTools sharedNetworkTools] GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary   * _Nullable responseObject) {
        
        // array是源数据的数组,未经过处理,有很多冗余的数据
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        
        // arrayM是我们需要展示的数据,已经处理好,只把和News.h中定义的key取出来,变为属性
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        for (NSDictionary *obj in array) {
            [arrayM addObject:[self newsWithDict:obj]];
        }
//        NSLog(@"%@",arrayM);
        finishied(arrayM.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
