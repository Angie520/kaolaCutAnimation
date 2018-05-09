//
//  ViewController.m
//  kaolaDemo
//
//  Created by Angie on 2018/5/8.
//  Copyright © 2018年 Angie. All rights reserved.
//

#import "ViewController.h"
#import "GBCutToView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@property (weak, nonatomic) IBOutlet UIButton *jumpButton;

@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    GBCutToView *cutToView = [[[NSBundle mainBundle] loadNibNamed:@"GBCutToView" owner:nil options:nil] lastObject];
    cutToView.topImage = [self convertViewToImage:self.topImageView];
    /// 这孩子那个图
    cutToView.middleImage = [UIImage imageNamed:@"background-1"];
    cutToView.bottomImage = [self convertViewToImage:self.bottomImageView];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:cutToView];
    
    [cutToView startAnimation];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor cyanColor];
        [self.navigationController pushViewController:vc animated:YES];
    });
}


- (UIImage *)convertViewToImage:(UIView *)view{
    //https://github.com/alskipp/ASScreenRecorder 录屏代码
    // 第二个参数表示是否非透明。如果需要显示半透明效果，需传NO，否则YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(view.bounds.size,YES,[UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)snapsHotView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size,YES,[UIScreen mainScreen].scale);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
