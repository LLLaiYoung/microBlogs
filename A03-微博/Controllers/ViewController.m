//
//  ViewController.m
//  A03-微博
//
//  Created by chairman on 15/12/20.
//  Copyright © 2015年 LaiYong. All rights reserved.
//

#import "ViewController.h"
#import "MicroBlog.h"
#import "MicroBlogCell.h"
#import "MicroBlogFrame.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray *microBlogFrames;
@end

@implementation ViewController
//懒加载
- (NSArray *)microBlogFrames {
    if (!_microBlogFrames) {
        //加载模型数据
        NSArray *microBlogs = [MicroBlog microBlogsList];
        NSMutableArray *frames = [NSMutableArray new];
        for (MicroBlog *microBlog in microBlogs) {
            //创建frame模型对象
            MicroBlogFrame *frame = [[MicroBlogFrame alloc] init];
            frame.width =  self.view.frame.size.width;
            frame.microBlog = microBlog;
            [frames addObject:frame];
        }
        _microBlogFrames = frames;
    }
    return _microBlogFrames;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.microBlogFrames);
    self.title = @"微博";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.microBlogFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.创建可重用的tableViewCell
    MicroBlogCell *cell = [MicroBlogCell microBlogCellWithTableView:tableView];
    //2.设置子控件的值
    cell.microBlogFrame = self.microBlogFrames[indexPath.row];
    //3.返回
    return cell;
}
//先执行heightForRowAtIndexPath 再执行cellForRowAtIndexPath
#pragma mark - UITabelViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MicroBlogFrame *frame = self.microBlogFrames[indexPath.row];
    return frame.rowHeight;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
