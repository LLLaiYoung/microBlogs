//
//  MicroBlogCell.m
//  A03-微博
//
//  Created by chairman on 15/12/20.
//  Copyright © 2015年 LaiYong. All rights reserved.
//

#import "MicroBlogCell.h"
#import "MicroBlogFrame.h"
#import "MicroBlog.h"

@interface MicroBlogCell ()

@property (nonatomic, weak) UIImageView *iconView;///<头像
@property (nonatomic, weak) UILabel *nameLabel;///<名字
@property (nonatomic, weak) UIImageView *vipView;///<VIP
@property (nonatomic, weak) UILabel *textsLabel;///<文本
@property (nonatomic, weak) UIImageView *pictureView;///<内容图片

@end

@implementation MicroBlogCell



//创建可以重用的自定义cell的对象   类方法中self代表这个类
+ (instancetype)microBlogCellWithTableView:(UITableView *)tableView {
    static NSString *reuseId = @"blog";
    MicroBlogCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        //因为是自定义Cell所以initWithStyle:UITableViewCellStyleDefault 这个Style随便写什么都无所谓,需要的是后面的reuseIdentifier 重用
        /**
         创建Cell的子控件应当是在这个Cell被初始化的时候创建也就是说是在if(!cell)里面写,在if外面写则有可能这个cell不是被新创建的而是从缓存池里面拿到的,从缓存池里面拿到的cell本身就是有子控件的cell,往已有子控件的cell里面再添加子控件是不合理的,至于添加会出现什么原因待测试
         */
    }
    return cell;
}

//重写构造方法,初始化(创建自定义cell内部的子控件)
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    //创建子控件
        //头像
        UIImageView *iconView = [UIImageView new];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        //昵称
        UILabel *nameLabel = [UILabel new];
        nameLabel.font = [UIFont systemFontOfSize:kNameFont]; //设置nameLabel的字体大小
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //会员
        UIImageView *vipView = [UIImageView new];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        //微博内容
        UILabel *textLabel = [UILabel new];
        textLabel.font = [UIFont systemFontOfSize:kTextFont]; //设置textLabel的字体大小
        textLabel.numberOfLines = 0;//设置换行
        [self.contentView addSubview:textLabel];
        self.textsLabel = textLabel;
        //微博图片
        UIImageView *pictureView = [UIImageView new];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}
//重写属性的setter方法,设置子控件的值
- (void)setMicroBlogFrame:(MicroBlogFrame *)microBlogFrame {
    if (_microBlogFrame!=microBlogFrame) {
        _microBlogFrame = microBlogFrame;
        //设置子控件显示的内容
        [self setSubViewsContent];
        //设置子控件的frame
        [self setSubViewsFrame];
    }
}
//设置子控件显示的内容
- (void)setSubViewsContent{
    MicroBlog *microBlog = self.microBlogFrame.microBlog;
    
    self.iconView.image = [UIImage imageNamed:microBlog.icon];
    self.nameLabel.text = microBlog.name;
    self.nameLabel.textColor = microBlog.isVip?[UIColor redColor]:[UIColor blackColor];
    self.vipView.image = microBlog.isVip?[UIImage imageNamed:@"vip"]:nil;
    self.textsLabel.text = microBlog.text;
    /**
     *发表的内容有图片才设置图片 不这样写会有警告
     *CUICatalog: Invalid asset name supplied: (null)
     */
    if (microBlog.picture) {
        self.pictureView.image = [UIImage imageNamed:microBlog.picture];
    } else {
        self.pictureView.image= nil;
    }
}
//设置子控件的frame
- (void)setSubViewsFrame {
    self.iconView.frame = self.microBlogFrame.iconFrame;
    self.nameLabel.frame = self.microBlogFrame.nameFrame;
    self.textsLabel.frame = self.microBlogFrame.textFrame;
    self.pictureView.frame = self.microBlogFrame.pictureFrame;
    self.vipView.frame = self.microBlogFrame.vipFrame;
}


@end
