//
//  TLImageView.m
//
//
//  Created by Phil Wright on 7/17/14.
//  Copyright (c) 2014 Touchopia, LLC. All rights reserved.
//

#import "TLImageView.h"

@interface  TLImageView ()
-(void)setupView;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation TLImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self setupView];
    }
    return self;
}

-(void)setupView
{
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:self.imageView];
    
//    UIView *leftTapView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 130, 200)];
//    leftTapView.backgroundColor = [UIColor redColor];
//    [self addSubview:leftTapView];
//
//    UIView *rightTapView = [[UIView alloc] initWithFrame:CGRectMake(172, 20, 130, 200)];
//    rightTapView.backgroundColor = [UIColor redColor];
//    [self addSubview:rightTapView];

}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)anImage
{
    if ((self = [self initWithFrame:frame])) {
        [self.imageView setImage:anImage];
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

- (UIImage *)image
{
    return self.imageView.image;
}

- (void)setAngle:(CGFloat)angle
{
    [super setAngle:angle];
    [UIView animateWithDuration:0.5 animations:^{
        [self.imageView.layer setTransform:CATransform3DMakeRotation(self.angle, 0, 0, 1)];
    } completion:^(BOOL finished) {
        if (finished) {
            if ([self.delegate respondsToSelector:@selector(spinWheelDidStartSpinningFromInertia:)]) {
                [self.delegate spinWheelDidFinishSpinning:self];
            }
        }
    }];
}

@end
