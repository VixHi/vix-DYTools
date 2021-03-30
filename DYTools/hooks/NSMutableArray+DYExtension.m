//
//  NSMutableArray+DYExtension.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/19.
//

#import "NSMutableArray+DYExtension.h"
#import <objc/runtime.h>

    
@implementation NSMutableArray (DYExtension)

/**
 hook 说明，处理项目中数组添加nil
 */
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //NSMutableArray添加nil
        Class cls = NSClassFromString(@"__NSArrayM");
        Method method1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method method2 = class_getInstanceMethod(cls, @selector(dy_insertObject:atIndex:));
        method_exchangeImplementations(method1, method2);
        
        //
        
        
        
        
    });
}

- (void)dy_insertObject:(id)obj atIndex:(NSInteger)index {
    
    if (obj == nil) {
        NSArray *syms = [NSThread  callStackSymbols];
        if ([syms count] > 1) {
            NSLog(@"%@--objectAtIndex:%ld",[syms objectAtIndex:1], index);
        } else {
             NSLog(@"<%@ %p> %@", [self class], self, NSStringFromSelector(_cmd));
        }
        return;
    }
    [self dy_insertObject:obj atIndex:index];
}
 


@end
