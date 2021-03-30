//
//  DYTimer.h
//  DYTools
//
//  Created by Vix Hi on 2021/3/23.
//

#import <Foundation/Foundation.h>

//typedef (void) (^DYTimeTaskBlock)(void);

NS_ASSUME_NONNULL_BEGIN

/**
 基于GCD的封装，timer的触发基于内核，非常准确，runloop的timer由于runloop的内部逻辑，造就runloop的timer存在一定的误差。
 */


@interface DYTimer : NSObject

/**
 定时器
 */
+ (NSString *)executeTask:(void(^)(void))task
              delay:(NSTimeInterval)seconds
           interval:(NSTimeInterval)seconds
            repeats:(BOOL)repeats
              async:(BOOL)async;


+ (NSString *)executeTask:(id)task
                      sel:(SEL)sel
                    delay:(NSTimeInterval)seconds
                 interval:(NSTimeInterval)seconds
                  repeats:(BOOL)repeats
                    async:(BOOL)async;

+ (void)cancelTask:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
