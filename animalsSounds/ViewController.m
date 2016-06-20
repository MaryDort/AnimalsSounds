//
//  ViewController.m
//  animalSounds
//
//  Created by Mariia Cherniuk on 12.05.16.
//  Copyright © 2016 marydort. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () 

@property (retain, nonatomic, readwrite) UIView *backgroundView;
@property (retain, nonatomic, readwrite) UIImageView *gorillaImageView;
@property (retain, nonatomic, readwrite) UIImageView *lionImageView;
@property (retain, nonatomic, readwrite) UIImageView *elephantImageView;
@property (retain, nonatomic, readwrite) UIImageView *catImageView;
@property (retain, nonatomic, readwrite) AVAudioPlayer *gorillaAudioPlayer;
@property (retain, nonatomic, readwrite) AVAudioPlayer *lionAudioPlayer;
@property (retain, nonatomic, readwrite) AVAudioPlayer *catAudioPlayer;
@property (retain, nonatomic, readwrite) AVAudioPlayer *elephantAudioPlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createBackgroundView];
    [self createElephantImageView];
    [self createLionImageView];
    [self createGorillaImageView];
    [self createAudioPlayer];
    [self createCatImageView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self changeBackroundCollor];
}

- (void)viewWillLayoutSubviews {
    _backgroundView.frame = self.view.bounds;
}

#pragma mark - CreateViews

- (void)createBackgroundView {
    _backgroundView = [[UIView alloc] init];

    [self.view addSubview:_backgroundView];
}

- (void)createElephantImageView {
    _elephantImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"elephant"]];
    _elephantImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _elephantImageView.userInteractionEnabled = YES;
    [_elephantImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(elephantPressed:)]];
    
    [self.view addSubview:_elephantImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_elephantImageView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_elephantImageView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.f
                                                           constant:0.f]];
}

- (void)createLionImageView {
    _lionImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lion"]];
    _lionImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _lionImageView.userInteractionEnabled = YES;
    [_lionImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lionPressed:)]];
    
    [self.view addSubview:_lionImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lionImageView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_lionImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f
                                                           constant:0.f]];
}

- (void)createGorillaImageView {
    _gorillaImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gorilla"]];
    _gorillaImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _gorillaImageView.userInteractionEnabled = YES;
    [_gorillaImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gorillaPressed:)]];
    
    [self.view addSubview:_gorillaImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gorillaImageView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_gorillaImageView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.f
                                                           constant:0.f]];
}

- (void)createCatImageView {
    _catImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat"]];
    _catImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _catImageView.userInteractionEnabled = YES;
    [_catImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(catPressed:)]];
    
    [self.view addSubview:_catImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_catImageView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.f
                                                           constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_catImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.f
                                                           constant:0.f]];
}

- (void)createAudioPlayer {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"elephant" ofType:@"mp3"];
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    
    _elephantAudioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
    [_elephantAudioPlayer prepareToPlay];
    
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"lion" ofType:@"mp3"];
    NSData *data2 = [NSData dataWithContentsOfFile:filePath2];
    NSError *error2;
    
    _lionAudioPlayer = [[AVAudioPlayer alloc] initWithData:data2 error:&error2];
    [_lionAudioPlayer prepareToPlay];
    
    NSString *filePath3 = [[NSBundle mainBundle] pathForResource:@"gorilla" ofType:@"mp3"];
    NSData *data3 = [NSData dataWithContentsOfFile:filePath3];
    NSError *error3;
    
    _gorillaAudioPlayer = [[AVAudioPlayer alloc] initWithData:data3 error:&error3];
    [_gorillaAudioPlayer prepareToPlay];
    
    NSString *filePath4 = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"mp3"];
    NSData *data4 = [NSData dataWithContentsOfFile:filePath4];
    NSError *error4;
    
    _catAudioPlayer = [[AVAudioPlayer alloc] initWithData:data4 error:&error4];
    [_catAudioPlayer prepareToPlay];
}

#pragma mark - Action

- (IBAction)elephantPressed:(UIGestureRecognizer *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:_elephantImageView.layer.transform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0.f, 0.f, 1.f)];
    animation.repeatCount = 10.f;
    animation.duration = 0.25f;
    animation.cumulative = YES;
    
    [_elephantImageView.layer addAnimation:animation forKey:@"transform"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animation2.fromValue = [NSValue valueWithCGPoint:_elephantImageView.layer.position];
    CGPoint randomPoint = [self generateRandomPositionTo:_elephantImageView];
    animation2.toValue = [NSValue valueWithCGPoint:randomPoint];
    animation2.repeatCount = 1.f;
    animation2.duration = 2.5f;
    animation2.cumulative = YES;
    _elephantImageView.layer.position = randomPoint;
    
    [_elephantImageView.layer addAnimation:animation2 forKey:@"position"];
    [_elephantAudioPlayer play];
}

- (IBAction)lionPressed:(UIGestureRecognizer *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:_lionImageView.layer.transform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0.f, 0.f, 1.f)];
    animation.repeatCount = 6.f;
    animation.duration = 0.25f;
    animation.cumulative = YES;
    
    [_lionImageView.layer addAnimation:animation forKey:@"transform"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animation2.fromValue = [NSValue valueWithCGPoint:_lionImageView.layer.position];
    CGPoint randomPoint = [self generateRandomPositionTo:_lionImageView];
    animation2.toValue = [NSValue valueWithCGPoint:randomPoint];
    animation2.repeatCount = 1.f;
    animation2.duration = 1.5f;
    animation2.cumulative = YES;
    _lionImageView.layer.position = randomPoint;
    
    [_lionImageView.layer addAnimation:animation2 forKey:@"position"];
    [_lionAudioPlayer play];
}

- (IBAction)gorillaPressed:(UIGestureRecognizer *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:_gorillaImageView.layer.transform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0.f, 0.f, 1.f)];
    animation.repeatCount = 10.f;
    animation.duration = 0.25f;
    animation.cumulative = YES;
    
    [_gorillaImageView.layer addAnimation:animation forKey:@"transform"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animation2.fromValue = [NSValue valueWithCGPoint:_gorillaImageView.layer.position];
    CGPoint randomPoint = [self generateRandomPositionTo:_gorillaImageView];
    animation2.toValue = [NSValue valueWithCGPoint:randomPoint];
    animation2.repeatCount = 1.f;
    animation2.duration = 2.5f;
    animation2.cumulative = YES;
    _gorillaImageView.layer.position = randomPoint;
    
    [_gorillaImageView.layer addAnimation:animation2 forKey:@"position"];
    [_gorillaAudioPlayer play];
}

- (IBAction)catPressed:(UIGestureRecognizer *)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:_catImageView.layer.transform];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0.f, 0.f, 1.f)];
    animation.repeatCount = 4.f;
    animation.duration = 0.25f;
    animation.cumulative = YES;
    
    [_catImageView.layer addAnimation:animation forKey:@"transform"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position"];
    
    animation2.fromValue = [NSValue valueWithCGPoint:_catImageView.layer.position];
    CGPoint randomPoint = [self generateRandomPositionTo:_catImageView];
    animation2.toValue = [NSValue valueWithCGPoint:randomPoint];
    animation2.repeatCount = 1.f;
    animation2.duration = 1.f;
    animation2.cumulative = YES;
    _catImageView.layer.position = randomPoint;
    
    [_catImageView.layer addAnimation:animation2 forKey:@"position"];
    [_catAudioPlayer play];
}

#pragma mark - RandomGenerator

- (CGPoint)generateRandomPositionTo:(UIView *)view {
    CGFloat xMin = CGRectGetWidth(view.frame) / 2;
    CGFloat yMin = CGRectGetHeight(view.frame) / 2;
    
    CGFloat x = xMin + arc4random_uniform(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(view.frame));
    CGFloat y = yMin + arc4random_uniform(CGRectGetHeight(self.view.bounds) - CGRectGetHeight(view.frame));
    
    return CGPointMake(x, y);
}

- (UIColor *)generateRandomColorTo:(UIView *)view {
    CGFloat red = arc4random() % 256 / 256.f;
    CGFloat green = arc4random() % 256 / 256.f;
    CGFloat blue = arc4random() % 256 / 256.f;
    CGFloat alpha = arc4random() % 256 / 256.f;
    
    return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
}

- (void)changeBackroundCollor {
    [UIView animateWithDuration:5.f
                          delay:0.f
                        options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         _backgroundView.backgroundColor = [self generateRandomColorTo:_backgroundView];
                     } completion:^(BOOL finished) {
                         [self changeBackroundCollor];
                     }];
}

@end
