//
//  ZYWeakTimer.h
//
//  Created by Zy on 18/3/5.
//  Copyright © 2016年 Zy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TimerHandler)(id _Nullable userInfo);

@interface ZYWeakTimer : NSObject

+ (NSTimer *_Nonnull)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nullable )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

+ (NSTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget block:(TimerHandler _Nonnull )block userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end

