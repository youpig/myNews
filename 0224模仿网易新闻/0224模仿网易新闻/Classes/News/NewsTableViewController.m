//
//  NewsTableViewController.m
//  0224模仿网易新闻
//
//  Created by 王庆岩 on 16/2/24.
//  Copyright © 2016年 王庆岩. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface NewsTableViewController ()

@property (nonatomic, strong) NSArray *newsList;

@end


@implementation NewsTableViewController

- (void)setNewsList:(NSArray *)newsList{
    _newsList = newsList;
    
    // 刷新表格
    [self.tableView reloadData];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 防止循环引用...
    __weak typeof(self) weakSelf = self;
    [News loadNewsListWithURLString:@"T1348647853363/0-20.html" finishied:^(NSArray *newsList) {
        weakSelf.newsList = newsList;
    }];
    
} 

#pragma mark - 数据源方法
// 表格一共有多少组
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell" forIndexPath:indexPath];
    
    cell.news = self.newsList[indexPath.row];
    
    return cell;
}

@end




























