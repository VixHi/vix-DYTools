//
//  DYRouter.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/24.
//

#import "DYRouter.h"


@implementation DYRouter

NSDictionary *routerMap_;


+ (void)initialize {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        routerMap_ = [self routerMapping];
    });
}


+ (UIViewController *)targetViewControllerWithClassName:(NSString *)className {
    if (className == nil || className.length <=0) {
        //错误处理
        return nil;
    }
    Class cls = NSClassFromString(className);
    NSParameterAssert([cls isSubclassOfClass:[UIViewController class]]);
    return [[cls alloc] init];
}

+ (UIViewController *)targetViewControllerWithViewModel:(id)viewModel {
    if (viewModel == nil) {
        return nil;
    }
    
    NSString *viewModelName = NSStringFromClass([viewModel class]);
    NSString *className =  routerMap_[viewModelName];
    return [self targetViewControllerWithClassName:className];
}

+ (NSDictionary *)routerMapping {
    //return @{@"viewModelName":@"ViewControllerName"};
    return @{@"TestSceneModel":@"TestScene01"};
}

@end
