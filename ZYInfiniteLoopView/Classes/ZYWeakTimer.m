//
//  ZYWeakTimer.m
//
//  Created by Zy on 18/3/5.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import "ZYWeakTimer.h"

@interface ZYWeakTimer ()

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ZYWeakTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    ZYWeakTimer *weakTimer = [[self alloc] init];
    weakTimer.target = aTarget;
    weakTimer.selector = aSelector;
    weakTimer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:weakTimer selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    return weakTimer.timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget block:(TimerHandler)block userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(timerBlock:) userInfo:@[[block copy], userInfo] repeats:yesOrNo];
}

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if (self.selector) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.target performSelector:self.selector withObject:timer.userInfo];
#pragma clang diagnostic pop
        }
    } else {
        [self.timer invalidate];
        self.timer = nil;
    }
}

+ (void)timerBlock:(NSArray *)userInfo {
    TimerHandler block = [userInfo firstObject];
    if (block) {
        block([userInfo lastObject]);
    }
}

- (void)dealloc {
    //NSLog(@"%s",__func__);
}

@end

