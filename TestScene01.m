//
//  TestScene01.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/19.
//

#import "TestScene01.h"
#import "DYPermanentThread.h"


@interface DYPerson : NSObject

@property(nonatomic, strong) NSMutableArray *data;


@end

@implementation DYPerson
@end



@interface TestScene01 ()

@property(nonatomic, strong) DYPermanentThread *thread;


@end

@implementation TestScene01

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;

    [self test02];

}

- (void)test01 {
//    NSString *obj = nil;
//    DYPerson *person = [[DYPerson alloc] init];
//    person.data = [NSMutableArray array];
//    [person.data addObject:@"vix"];
//    [person.data addObject:obj];
//
//    NSLog(@"%@", person.data);
    
    NSString *key = nil;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"vix" forKey:key];
    [dic setValue:@"vix" forKey:@"name"];

    NSLog(@"%@", dic);

}


- (void)test02 {
    DYPermanentThread *thread = [[DYPermanentThread alloc] init];
    self.thread = thread;
    [self.thread executeTast:^{
        NSLog(@"----- task ------");
    }];

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self.thread executeTast:^{
        NSLog(@"----- task ------");
    }];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}


@end
