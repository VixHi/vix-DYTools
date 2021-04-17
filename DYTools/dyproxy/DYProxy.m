//
//  DYProxy.m
//  DYTools
//
//  Created by Vix Hi on 2021/4/17.
//

#import "DYProxy.h"

@implementation DYProxy

+ (instancetype)proxyWithTarget:(id)target {
    DYProxy *proxy = [DYProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return  [self.target methodSignatureForSelector:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self.target;
}






@end
