//
//  MicroBlogFrame.m
//  A03-微博
//
//  Created by chairman on 15/12/22.
//  Copyright © 2015年 LaiYong. All rights reserved.
//

#import "MicroBlogFrame.h"
#import "MicroBlog.h"

/**
 *  只读的属性 用self.语法赋不了值,用_访问即可赋值 只能在自己这个类这样使用
 */

@implementation MicroBlogFrame
//重写属性的setter方法,取得模型数据 计算frame 计算行高
- (void)setMicroBlog:(MicroBlog *)microBlog {
    if (_microBlog!=microBlog) {
        _microBlog = microBlog;
        //边距
        CGFloat margin = 10;
        //头像
        CGFloat iconW = 30;
        CGFloat iconH = 30;
        CGFloat iconX = margin;
        CGFloat iconY = margin;
        _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
        //昵称
        //    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
        //    //计算文本的大小
        //    CGSize nameSize = [self.microBlog.name boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;//[UIFont systemFontOfSize:15]设置计算文本的字体大小为15号,如果出现文本内容显示不完全,应该是字体大小设置和计算的文本字体大小不一致,label的字体大小默认是17
        CGSize nameSize = [self sizeWithText:microBlog.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:kNameFont];
        CGFloat nameX = CGRectGetMaxX(_iconFrame)+margin;
        CGFloat nameY = iconY + (iconH - nameSize.height)/2;
        _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
        
        //会员
        CGFloat vipW = 14;
        CGFloat vipH = 14;
        CGFloat vipY = nameY;
        CGFloat vipX = CGRectGetMaxX(_nameFrame)+margin;
        _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
        //微博内容
        CGSize textSize = [self sizeWithText:microBlog.text maxSize:CGSizeMake(_width-(margin+margin), MAXFLOAT) fontSize:kTextFont];
        CGFloat textX = iconX;
        CGFloat textY = CGRectGetMaxY(_iconFrame)+margin;
        /**
         * CGSize size = {4,5};//结构体写法{} 一个结构体用一个{}
         * 例如 CGRectMake(textX, textY, textSize.width, textSize.height) == (CGRect){{textX,textY},{textSize.width,textSize.height}} == (CGRect){{textX,textY},textSize}
         *
         */
        _textFrame = (CGRect){{textX,textY},textSize};//==CGRectMake(textX, textY, textSize.width, textSize.height);

        //微博图片
        if (self.microBlog.picture) {
            CGFloat pictureW = 100;
            CGFloat pictureH = 100;
            CGFloat pictureX = iconX;
            CGFloat pictureY = CGRectGetMaxY(_textFrame)+margin;
            _pictureFrame = (CGRect){{pictureX,pictureY},{pictureW,pictureH}};
            _rowHeight = CGRectGetMaxY(_pictureFrame) + margin;
        } else{
            _rowHeight = CGRectGetMaxY(_textFrame) + margin;
        }
    }
}

/**
 *  NSStringDrawingUsesLineFragmentOrigin、NSFontAttributeName 是在UIKit框架下的
 *
 */
//计算文字大小
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}

@end
