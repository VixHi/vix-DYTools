//
//  DYPermanentThread.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/19.
//

#import "DYPermanentThread.h"

@interface DYPermanentThread()

@property(nonatomic, strong) NSThread *thread;


@end

@implementation DYPermanentThread


- (instancetype)init {
    self = [super init];
    if (self) {

        self.thread = [[NSThread alloc] initWithBlock:^{
            //创建上下文
            CFRunLoopSourceContext context = {0};
            
            //创建source
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(CFAllocatorGetDefault(), 0, &context);
            
            //添加source事件
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            
            //释放source
            CFRelease(source);
            
            //启动runloop
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
        }];

        [self.thread start];
    }
    return self;
}


/**
 执行任务
 */
- (void)executeTast:(DYThreadTask)task{
    if (!self.thread || !task) {
        return;
    }
    [self performSelector:@selector(dy_doTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}

- (void)dy_doTask:(DYThreadTask)task {
    task();
}

/**
 停止任务
 */
- (void)stop {
    if (!self.thread) {
        return;
    }
    [self performSelector:@selector(dy_doStop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)dy_doStop {
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}

- (void)dealloc {
    [self stop];
}

@end
