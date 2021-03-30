//
//  NSMutableDictionary+DYExtension.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/19.
//

#import "NSMutableDictionary+DYExtension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (DYExtension)

+(void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSDictionaryM");
        Method method1 = class_getInstanceMethod(cls, @selector(setObject:forKey:));
        Method method2 = class_getInstanceMethod(cls, @selector(dy_setObject:forKey:));
        method_exchangeImplementations(method1, method2);
    });
}

- (void)dy_setObject:(id)value forKey:(id)key {
    if (key == nil) {
        NSArray *syms = [NSThread  callStackSymbols];
        if ([syms count] > 1) {
            NSLog(@"%@ 字典value:%@",[syms objectAtIndex:1], value);
        } else {
             NSLog(@"<%@ %p> %@", [self class], self, NSStringFromSelector(_cmd));
        }
        return;
    }
    [self dy_setObject:value forKey:key];
}



@end
