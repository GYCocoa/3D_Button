//
//  ViewController.m
//  按钮旋转
//
//  Created by 张广义 on 2017/9/11.
//  Copyright © 2017年 张广义. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)buttonAction:(UIButton *)sender
{
    UIButton *theButton = sender;
    CAAnimation* myAnimationRotate = [self animationRotate];
    
    CAAnimationGroup *m_pGroupAnimation     = [CAAnimationGroup animation];
    m_pGroupAnimation.delegate              =self;
    m_pGroupAnimation.removedOnCompletion   =NO;
    m_pGroupAnimation.duration              =1;
    m_pGroupAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    m_pGroupAnimation.repeatCount           =1;//FLT_MAX;  //"forever";
    m_pGroupAnimation.fillMode              =kCAFillModeForwards;
    m_pGroupAnimation.animations             = [NSArray arrayWithObjects:myAnimationRotate,nil];
    
    [theButton.layer addAnimation:m_pGroupAnimation forKey:@"animationRotate"];
}


- (CAAnimation *)animationRotate
{
    //    UIButton *theButton = sender;
    // rotate animation
    CATransform3D rotationTransform  = CATransform3DMakeRotation(M_PI, 0.5, 1,1);
    
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.toValue        = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration        = 0.3;
    animation.autoreverses    = YES;
    animation.cumulative    = YES;
    animation.repeatCount    = 1;
    animation.beginTime        = 0.1;
    animation.delegate        = self;
    
    return animation;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //todo
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
