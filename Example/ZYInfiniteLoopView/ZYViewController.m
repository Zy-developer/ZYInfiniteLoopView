//
//  ZYViewController.m
//  ZYInfiniteLoopView
//
//  Created by Zy on 03/05/2018.
//  Copyright (c) 2018 Zy. All rights reserved.
//

#import "ZYViewController.h"

#import "ZYInfiniteLoopView.h"

#define width self.view.frame.size.width
#define height self.view.frame.size.height

@interface ZYViewController () <ZYInfiniteLoopViewDelegate>

/** ScrollView */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 图像数组 */
@property (nonatomic, strong) NSArray<NSString *> *imgUrls;
/** 标题数组 */
@property (nonatomic, strong) NSArray<NSString *> *titles;

@end

@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    [self.view addSubview:self.scrollView];
    [self loopViewDelegate];
    [self loopViewBlock];
    [self loopViewTest];
    [self loopViewTest2];
}

- (void)loopViewDelegate {
    // 类方法
    ZYInfiniteLoopView *loopView = [ZYInfiniteLoopView infiniteLoopViewWithImageUrls:self.imgUrls titles:self.titles didSelectedImage:^(NSInteger index) {
        NSLog(@"点击了轮播图 - %zd", index);
    }];
    // 设置代理
    loopView.delegate = self;
    loopView.timeInterval = 5;
    loopView.animationDuration = 1.5f;
    loopView.animationType = InfiniteLoopViewAnimationTypeReveal;
    // 设置frame
    loopView.frame = CGRectMake(0, 0, width, height * 0.25);
    [self.scrollView addSubview:loopView];
}

- (void)loopViewBlock {
    // 实例方法
    ZYInfiniteLoopView *loopView = [[ZYInfiniteLoopView alloc] initWithImageUrls:self.imgUrls titles:nil didSelectedImage:^(NSInteger index) {
        NSLog(@"loopViewBlock - %zd", index);
    }];
    // 是否隐藏蒙版
    loopView.hideCover = NO;
    // 是否自动轮播
    loopView.autoPlayer = YES;
    // 设置轮播时间
    // loopView.timeInterval = 1.5f;
    // 是否隐藏标题, 如果标题数组为nil, 请手动设置隐藏, 默认为NO
    loopView.hideTitleLabel = YES;
    // 标题文字的颜色
    // loopView.titleTextColor = [UIColor blueColor];
    // 标题文字的尺寸
    // loopView.titleTextFont = [UIFont systemFontOfSize:16];
    // 设置标题的背景颜色
    // loopView.bgViewColor = RGBAColor(23, 138, 230, 0.4);
    // 以下两个设置pageControl的圆点颜色
    // loopView.pageIndicatorColor = [UIColor yellowColor];
    // loopView.currentPageIndicatorColor = [UIColor magentaColor];
    // 以下两个设置pageControl的图片, 用于替代默认的圆点
    loopView.pageImage = [UIImage imageNamed:@"PageControlImage"];
    loopView.currentPageImage = [UIImage imageNamed:@"CurrentPageControlImage"];
    // 设置轮播时的占位图, 用于网络状态不好未能及时请求到网络图片时展示
    // loopView.placeholderImage = [UIImage imageNamed:@"PlaceholderImage"];
    // 枚举, 设置标题的展示位置, 不设置时默认在底部
    // loopView.titlePosition = InfiniteLoopViewTitlePositionTop;
    // 枚举, 设置pageControl的位置, 只有设置标题在顶部时此设置才有效, 默认居中
    // loopView.pagePosition = InfiniteLoopViewPagePositionCenter;
    // 过渡动画执行时间
    loopView.animationDuration = 1.5f;
    // 过渡动画类型
    loopView.animationType = InfiniteLoopViewAnimationTypeCube;
    // 过渡动画方向
    loopView.animationDirection = InfiniteLoopViewAnimationDirectionRight;
    // 设置frame
    loopView.frame = CGRectMake(0, height * 0.25 + 10, width, height * 0.25);
    [self.scrollView addSubview:loopView];
}

- (void)loopViewTest {
    ZYInfiniteLoopView *loopView = [[ZYInfiniteLoopView alloc] initWithImageUrls:self.imgUrls titles:self.titles didSelectedImage:^(NSInteger index) {
        NSLog(@"loopViewTest - %zd", index);
    }];
    loopView.timeInterval = 1.0f;
    loopView.bgViewColor = [UIColor clearColor];
    loopView.titleTextColor = [UIColor yellowColor];
    loopView.titleTextFont = [UIFont systemFontOfSize:18];
    loopView.pageIndicatorColor = [UIColor redColor];
    loopView.currentPageIndicatorColor = [UIColor blueColor];
    loopView.titlePosition = InfiniteLoopViewTitlePositionTop;
    loopView.pagePosition = InfiniteLoopViewPagePositionLeft;
    loopView.animationType = InfiniteLoopViewAnimationTypePageCurl;
    loopView.animationDirection = InfiniteLoopViewAnimationDirectionBottom;
    loopView.frame = CGRectMake(0, height * 0.5 + 20, width, height * 0.25);
    [self.scrollView addSubview:loopView];
}

- (void)loopViewTest2 {
    ZYInfiniteLoopView *loopView = [ZYInfiniteLoopView infiniteLoopViewWithImageUrls:self.imgUrls titles:self.titles didSelectedImage:^(NSInteger index) {
        NSLog(@"loopViewTest2 - %zd", index);
    }];
    loopView.hideTitleLabel = YES;
    loopView.titlePosition = InfiniteLoopViewTitlePositionTop;
    loopView.pagePosition = InfiniteLoopViewPagePositionRight;
    loopView.animationDuration = 2.0f;
    loopView.animationType = InfiniteLoopViewAnimationTypeRippleEffect;
    loopView.frame = CGRectMake(0, height * 0.75 + 30, width, height * 0.25);
    loopView.pageIndicatorColor = [UIColor orangeColor];
    loopView.currentPageIndicatorColor = [UIColor magentaColor];
    [self.scrollView addSubview:loopView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ZYInfiniteLoopViewDelegate
- (void)infiniteLoopView:(ZYInfiniteLoopView *)infiniteLoopView didSelectedImage:(NSInteger)selectedImageIndex {
    NSLog(@"ZYInfiniteLoopViewDelegate - %zd", selectedImageIndex);
}


- (NSArray *)imgUrls {
    if (!_imgUrls) {
        _imgUrls = @[
                     @"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/06/0F/ChMkJ1eB42-IXICZAC-b2z1kN5IAATZEAGIpKQAL5vz687.jpg", 
                     @"image_01.jpg",
                     @"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/06/0F/ChMkJleB422IXV93ACmx9ykNKG8AATZEAFaBoMAKbIP392.jpg",
                     @"image_02.jpg",
                     @"http://desk.fd.zol-img.com.cn/t_s1280x1024c5/g5/M00/0F/01/ChMkJleYmTCID1AzAAau5xfqy0UAAT5igN01VIABq7_951.jpg"
                     ];
    }
    return _imgUrls;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[
                    @"第一张图, 网络加载图像",
                    @"第二张图, 显示本地图像",
                    @"第三张图, 网络加载图像",
                    @"第四张图, 显示本地图像",
                    @"第五张图, 网络加载图像"
                    ];
    }
    return _titles;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.bounces = YES;
        _scrollView.frame = self.view.bounds;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.contentSize = CGSizeMake(width, height + 120);
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

@end
