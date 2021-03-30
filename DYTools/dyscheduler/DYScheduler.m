//
//  DYScheduler.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/24.
//

#import "DYScheduler.h"

@implementation DYScheduler


+ (UIViewController *)targetViewControllerWithClassName:(NSString *)className {
    if (className == nil || className.length <=0) {
        return nil;
    }
    Class cls = NSClassFromString(className);
    NSParameterAssert([cls isSubclassOfClass:[UIViewController class]]);
    return [[cls alloc] init];
}





@end
