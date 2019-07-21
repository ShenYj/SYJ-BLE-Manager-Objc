//
//  SYJHomeViewController.m
//  BLEManagerObjc
//
//  Created by ShenYj on 2019/7/20.
//  Copyright © 2019 ShenYj. All rights reserved.
//

#import "SYJHomeViewController.h"

@interface SYJHomeViewController ()

@property (nonatomic, strong) FLAnimatedImageView *loadingImageView;

@end

@implementation SYJHomeViewController

- (void)prepareSubBaseView
{
    [self.view addSubview:self.loadingImageView];
    [self.loadingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
    }];
}


#pragma mark
#pragma mark - lazy

- (FLAnimatedImageView *)loadingImageView {
    if (!_loadingImageView) {
        NSData *image = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loading.gif" ofType:nil]];
        _loadingImageView = [[FLAnimatedImageView alloc] init];
        _loadingImageView.contentMode = UIViewContentModeScaleAspectFit;
        _loadingImageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:image];
        [_loadingImageView sizeToFit];
    }
    return _loadingImageView;
}

@end
