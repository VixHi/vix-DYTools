//
//  DYWeakSingleton.m
//  DYTools
//
//  Created by Vix Hi on 2021/4/22.
//

#import "DYWeakSingleton.h"

@implementation DYWeakSingleton

+ (DYWeakSingleton *)share {
    static __weak DYWeakSingleton *singleton;
    DYWeakSingleton *strongSingleton = singleton;
    @synchronized (self) {
        if (strongSingleton == nil) {
            strongSingleton = [[self alloc] init];
            singleton = strongSingleton;
        }
    }
    return strongSingleton;
}

@end
