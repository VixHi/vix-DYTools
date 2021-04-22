//
//  DYThread.h
//  DYTools
//
//  Created by Vix Hi on 2021/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DYThreadTask)(void);

@interface DYPermanentThread : NSObject

/**
 利用runloop来保证线程存活
 
 */



/**
 执行任务
 线程的生命周期跟随控制器的生命周期
 isDealloc: YES 线程的生命周期跟随控制器的生命周期
             NO 线程的生命周期不受控制控制，
 - (void)executeTast:(DYThreadTask)task dealloc:(BOOL)isDealloc
 */
- (void)executeTast:(DYThreadTask)task;

/**
 结束线程的生命周期
 */
- (void)stop;


/**
 常驻线程
 */


@end

NS_ASSUME_NONNULL_END
