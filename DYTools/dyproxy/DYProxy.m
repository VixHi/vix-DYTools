//
//  DYProxy.m
//  DYTools
//
//  Created by Vix Hi on 2021/4/17.
//

#import "DYProxy.h"

@implementation DYProxy

- (void)dealloc {
    NSLog(@"-----");
    NSLog(@"%s", __func__);
}

+ (instancetype)proxyWithTarget:(id)target {
    DYProxy *proxy = [DYProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return  [self.target methodSignatureForSelector:sel];
}


- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}


+ (id)proxyToInstance:(NSString *)className {
    Class cls = NSClassFromString(className);
    return [[cls alloc] init];
}

+ (Class)proxyToClass:(NSString *)className {
    return  NSClassFromString(className);
}



@end
