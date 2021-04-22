//
//  RedView.m
//  DYTools
//
//  Created by Vix Hi on 2021/4/20.
//

#import "RedView.h"

@implementation RedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"red");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return YES;
}

@end
