//
//  DYScheduler.h
//  DYTools
//
//  Created by Vix Hi on 2021/3/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYScheduler : NSObject

/**
 根据字符串获取VC用语跳转
 className: 和targetViewController类名称必须保持一致
 */
+ (UIViewController *)targetViewControllerWithClassName:(NSString *)className;


@end

NS_ASSUME_NONNULL_END
