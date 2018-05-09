//
//  GBCutToView.h
//  kaolaDemo
//
//  Created by Angie on 2018/5/8.
//  Copyright © 2018年 Angie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GBCutToView : UIView

@property (nonatomic, strong) UIImage *topImage;

@property (nonatomic, strong) UIImage *middleImage;

@property (nonatomic, strong) UIImage *bottomImage;

- (void)startAnimation ;
@end
