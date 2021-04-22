//
//  DYProxy.h
//  DYTools
//
//  Created by Vix Hi on 2021/4/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYProxy : NSProxy
//消息转发的target
@property (weak, nonatomic) id target;

+ (instancetype)proxyWithTarget:(id)target;

/**
 获取实例对象
 */
+ (id)proxyToInstance:(NSString *)className;
/**
 获取类对象
 */
+ (Class)proxyToClass:(NSString *)className;


@end

NS_ASSUME_NONNULL_END
