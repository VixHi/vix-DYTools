//
//  DYPerson.m
//  DYTools
//
//  Created by Vix Hi on 2021/4/18.
//

#import "DYPerson.h"

@interface DYPerson()

@property(nonatomic, strong) NSDictionary *param;

@end

@implementation DYPerson

+ (void)callBlock:(NSDictionary *)dic {
    
    
    NSLog(@"=== %@", dic);
}

- (void)callBlock:(NSDictionary *)dic {
    NSLog(@"**** %@", dic);
}
- (void)test {
//    self.param
}

@end
