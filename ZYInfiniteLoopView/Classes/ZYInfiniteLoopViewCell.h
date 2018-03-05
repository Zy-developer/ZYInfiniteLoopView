//
//  ZYInfiniteLoopViewCell.h
//
//  Created by Zy on 18/3/5.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYInfiniteLoopViewCell : UICollectionViewCell

/** 显示的图片地址 */
@property (nonatomic, strong) NSString *imageUrl;
/** 显示的占位图 */
@property (nonatomic, strong) UIImage *placeholderImg;

/** 注册名称 */
+ (NSString *)registerName;

@end
