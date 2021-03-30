//
//  DYTimer.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/23.
//

#import "DYTimer.h"

@implementation DYTimer

static NSMutableDictionary *timers_;
dispatch_semaphore_t semaphore_;


+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [NSMutableDictionary dictionary];
        semaphore_ = dispatch_semaphore_create(1);
    });
}


+ (NSString *)executeTask:(id)task
                      sel:(SEL)sel
                    delay:(NSTimeInterval)delay
                 interval:(NSTimeInterval)interval
                  repeats:(BOOL)repeats
                    async:(BOOL)async {
    if (!task || !sel) {
        return nil;
    }
    
    return [self executeTask:^{
        if ([task respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [task performSelector:sel];
#pragma clang diagnostic pop

        }
    } delay:delay interval:interval repeats:repeats async:async];
}

+ (NSString *)executeTask:(void(^)(void))task
              delay:(NSTimeInterval)delay
           interval:(NSTimeInterval)interval
            repeats:(BOOL)repeats
              async:(BOOL)async {
    if (!task || delay < 0 || ((interval <= 0) & repeats)) {
        return nil;
    }
    
    dispatch_queue_t queue = async?dispatch_get_global_queue(0, 0):dispatch_get_main_queue();
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, delay * NSEC_PER_SEC);
    
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    NSString *name = [NSString stringWithFormat:@"%lu", (unsigned long)timers_.count];
    timers_[name] = timer;
    dispatch_semaphore_signal(semaphore_);
    
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!repeats) {
            [self cancelTask:name];
        }
    });
    dispatch_resume(timer);
    
    
    return name;
}

+ (void)cancelTask:(NSString *)name {
    if (name.length <= 0) {
        return;
    }
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    dispatch_source_t timer = timers_[name];
    if (timer) {
        dispatch_source_cancel(timer);
        [timers_ removeObjectForKey:name];
    }
    dispatch_semaphore_signal(semaphore_);
    
}


@end
