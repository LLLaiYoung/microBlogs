//
//  MicroBlogFrame.h
//  A03-微博
//
//  Created by chairman on 15/12/22.
//  Copyright © 2015年 LaiYong. All rights reserved.
//

#define kNameFont 15
#define kTextFont 14

//#import <Foundation/Foundation.h>
//#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>//UIKit框架依赖于 Foundation和CoreGraphics 框架
/**
 *CGRect 是在<CoreGraphics/CoreGraphics.h> 框架下的 UIKit依赖于<CoreGraphics/CoreGraphics.h>框架
 */
@class MicroBlog;

@interface MicroBlogFrame : NSObject
@property (nonatomic, strong) MicroBlog *microBlog;

@property (nonatomic, assign, readonly) CGRect nameFrame;
@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGRect vipFrame;
@property (nonatomic, assign, readonly) CGRect pictureFrame;
@property (nonatomic, assign ) CGFloat width;///屏幕宽
@property (nonatomic, assign, readonly) CGFloat rowHeight;///<行高

@end
