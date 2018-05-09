//
//  GBCutToView.m
//  kaolaDemo
//
//  Created by Angie on 2018/5/8.
//  Copyright © 2018年 Angie. All rights reserved.
//

#import "GBCutToView.h"

@interface GBCutToView ()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;

@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftViewLeftConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewTopContraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewTopContraint;

@end

@implementation GBCutToView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    
    self.leftViewLeftConstraint.constant = -240;
    [self layoutIfNeeded];
    self.backImage.alpha = 0;
    
    self.topImageView.image = self.topImage;
    self.middleImageView.image = self.middleImage;
    self.bottomImageView.image = self.bottomImage;
}

- (void)setTopImage:(UIImage *)topImage {
    _topImage = topImage;
    self.topImageView.image = topImage;
}

- (void)setMiddleImage:(UIImage *)middleImage {
    _middleImage = middleImage;
    self.middleImageView.image = middleImage;
}

- (void)setBottomImage:(UIImage *)bottomImage {
    _bottomImage = bottomImage;
    self.bottomImageView.image = bottomImage;
}


- (void)startAnimation {
    [UIView animateWithDuration:1.0 animations:^{
        self.topViewTopContraint.constant = - 151;
        self.bottomViewTopContraint.constant = 468;
        self.topImageView.alpha = 0;
        self.bottomImageView.alpha = 0;
        self.backImage.alpha = 1;
        self.leftViewLeftConstraint.constant = 0;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1.0 animations:^{
                self.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        });
    }];
}


@end
