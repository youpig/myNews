//
//  NewsCell.m
//  0224模仿网易新闻
//
//  Created by 王庆岩 on 16/2/25.
//  Copyright © 2016年 王庆岩. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"
#import <UIImageView+AFNetworking.h>


@interface NewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
 

@end

@implementation NewsCell

-(void)setNews:(News *)news{
    _news = news;
    
    self.titleLabel.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"回帖数%d",news.replyCount];
    
    // 用AFN实现加载图片
    [self.iconView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    
}


- (void)awakeFromNib {
    // 设置换行宽度
    self.digestLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - self.digestLabel.frame.origin.x - 16;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
