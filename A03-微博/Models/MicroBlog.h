//
//  MicroBlog.h
//  A03-微博
//
//  Created by chairman on 15/12/20.
//  Copyright © 2015年 LaiYong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MicroBlog : NSObject
@property (nonatomic, copy) NSString *text;///<内容
@property (nonatomic, copy) NSString *icon;///<头像
@property (nonatomic, copy) NSString *name;///<昵称
@property (nonatomic, copy) NSString *picture;///<内容图片
@property (nonatomic, assign,getter=isVip) BOOL vip;///<会员

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)mocroBlogWithDic:(NSDictionary *)dic;
+ (NSArray *)microBlogsList;


@end
