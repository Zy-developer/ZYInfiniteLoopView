//
//  ZYInfiniteLoopViewCell.m
//
//  Created by Zy on 18/3/5.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "ZYInfiniteLoopViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZYInfiniteLoopViewCell ()

/** 轮播图图像视图 */
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ZYInfiniteLoopViewCell

+ (NSString *)registerName {
    return @"ZYInfiniteLoopViewCell";
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.imageView setClipsToBounds:YES];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;
    if (imageUrl.length) {
        if ([imageUrl hasPrefix:@"http"]) {
            NSURL *url = [NSURL URLWithString:imageUrl];
            [self.imageView sd_setImageWithURL:url placeholderImage:self.placeholderImg options:SDWebImageRetryFailed | SDWebImageRefreshCached | SDWebImageContinueInBackground | SDWebImageAllowInvalidSSLCertificates];
        } else {
            self.imageView.image = [UIImage imageNamed:imageUrl];
        }
    } else {
        self.imageView.image = self.placeholderImg;
    }
}

- (void)setPlaceholderImg:(UIImage *)placeholderImg {
    _placeholderImg = placeholderImg;
}

@end

