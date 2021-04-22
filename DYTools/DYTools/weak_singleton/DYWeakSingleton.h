//
//  DYWeakSingleton.h
//  DYTools
//
//  Created by Vix Hi on 2021/4/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DYWeakSingleton;

@interface DYWeakSingleton : NSObject

+ (DYWeakSingleton *)share;

@end

NS_ASSUME_NONNULL_END
