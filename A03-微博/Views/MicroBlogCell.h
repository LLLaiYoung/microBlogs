//
//  MicroBlogCell.h
//  A03-微博
//
//  Created by chairman on 15/12/20.
//  Copyright © 2015年 LaiYong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MicroBlogFrame;

@interface MicroBlogCell : UITableViewCell
@property (nonatomic, strong) MicroBlogFrame *microBlogFrame;
+ (instancetype)microBlogCellWithTableView:(UITableView *)tableView;
@end
