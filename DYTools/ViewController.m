//
//  ViewController.m
//  DYTools
//
//  Created by Vix Hi on 2021/3/17.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>
#import "DYTimer.h"
#import "DYRouter.h"
#import "TestSceneModel.h"



@interface ViewController ()

@property(nonatomic, strong) UIButton *btn;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    os_unfair_lock lock = OS_UNFAIR_LOCK_INIT;
//
//
//    os_unfair_lock_lock(&lock);
    NSString *key = nil;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"vix" forKey:key];
    [dic setValue:@"vix" forKey:@"name"];

    NSLog(@"%@", dic);
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    [self.view addSubview:lab];
    [lab setTextColor:UIColor.blueColor];
    __block int i = 60;
    [DYTimer executeTask:^{
        lab.text = [NSString stringWithFormat:@"%d S", i];
        i--;
    } delay:0 interval:1 repeats:YES async:NO];
    
//    NSString *tem = nil;
//    NSMutableArray *array = [NSMutableArray array];
//    [array addObject:@"vix"];
//    [array insertObject:tem atIndex:0];
//    NSLog(@"%@", array);
    
    self.btn = UIButton.new;
    self.btn.frame = CGRectMake(100, 100, 100, 50);
    [self.btn setTitle:@"点击" forState:UIControlStateNormal];
    [self.view addSubview:self.btn];
    self.btn.backgroundColor = UIColor.lightGrayColor;
    
    [self.btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnAction:(UIButton *)sender {
//    UIViewController *vc = [DYRouter targetViewControllerWithClassName:@"TestScene"];
//    [self.navigationController pushViewController:vc animated:YES];
    
    TestSceneModel *model = TestSceneModel.new;
    UIViewController *vc = [DYRouter targetViewControllerWithViewModel:model];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
