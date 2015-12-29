//
//  MicroBlog.m
//  A03-微博
//
//  Created by chairman on 15/12/20.
//  Copyright © 2015年 LaiYong. All rights reserved.
//

#import "MicroBlog.h"

@implementation MicroBlog
- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)mocroBlogWithDic:(NSDictionary *)dic {
    return  [[self alloc]initWithDic:dic];
}
+ (NSArray *)microBlogsList {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"microblog.plist" ofType:nil];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArray) {
        MicroBlog *microBlog = [MicroBlog mocroBlogWithDic:dic];
        [tempArray addObject:microBlog];
    }
    return tempArray;
}

@end
