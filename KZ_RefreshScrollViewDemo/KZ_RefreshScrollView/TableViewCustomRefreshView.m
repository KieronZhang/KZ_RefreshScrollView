//
//  TableViewCustomRefreshView.m
//  KZ_RefreshScrollView
//
//  Created by Kieron Zhang on 2016/12/24.
//  Copyright © 2016年 Kieron Zhang. All rights reserved.
//

#import "TableViewCustomRefreshView.h"

@interface TableViewCustomRefreshView ()

@property (nonatomic, assign) BOOL isRefreshing;

@end

@implementation TableViewCustomRefreshView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 75)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 275, 55)];
        backgroundImageView.image = [UIImage imageNamed:@"bg"];
        [self addSubview:backgroundImageView];
        backgroundImageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        
        logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        logoImageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetHeight(self.bounds) + 33);
        [self addSubview:logoImageView];
    }
    return self;
}

- (void)moveSquareWithPercent:(float)percent {
    if (percent > 1) {
        percent = 1;
    }
    logoImageView.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetHeight(self.bounds) + 33 - percent * 60);
}

- (void)normalStatus {
    if (!self.isRefreshing) {
        return;
    }
    self.isRefreshing = NO;
    [logoImageView.layer removeAnimationForKey:@"CAAnimationGroup"];
}

- (void)releaseToRefreshStatus {
    
}

- (void)refreshingStatus {
    if (self.isRefreshing) {
        return;
    }
    self.isRefreshing = YES;
    [self startTransform];
}

- (void)startTransform {
    CATransform3D rotationTransform = CATransform3DMakeRotation(0, 0.0, 0, 1.0);
    CATransform3D rotationTransform1 = CATransform3DMakeRotation(-M_PI / 60.0f, 0.0, 0, 1.0);
    CATransform3D rotationTransform2 = CATransform3DMakeRotation(M_PI / 60.0f, 0.0, 0, 1.0);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform1];
    animation.duration = 0.1;
    animation.beginTime = 0;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation1.fromValue = [NSValue valueWithCATransform3D:rotationTransform1];
    animation1.toValue = [NSValue valueWithCATransform3D:rotationTransform2];
    animation1.duration = 0.2;
    animation1.beginTime = 0.1;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation2.fromValue = [NSValue valueWithCATransform3D:rotationTransform2];
    animation2.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation2.duration = 0.1;
    animation2.beginTime = 0.3;
    
    CAAnimationGroup *m_pGroupAnimation = [CAAnimationGroup animation];
    m_pGroupAnimation.duration = 0.5;
    m_pGroupAnimation.repeatCount = FLT_MAX;
    m_pGroupAnimation.animations = [NSArray arrayWithObjects:animation, animation1, animation2, nil];
    [logoImageView.layer addAnimation:m_pGroupAnimation forKey:@"CAAnimationGroup"];
}

@end
