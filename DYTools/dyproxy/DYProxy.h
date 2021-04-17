//
//  DYProxy.h
//  DYTools
//
//  Created by Vix Hi on 2021/4/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYProxy : NSProxy
+ (instancetype)proxyWithTarget:(id)target;
@property (weak, nonatomic) id target;


@end

NS_ASSUME_NONNULL_END
