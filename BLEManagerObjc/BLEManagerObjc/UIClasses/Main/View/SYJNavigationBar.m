//
//  SYJNavigationBar.m
//  BLEManagerObjc
//
//  Created by ShenYj on 2019/7/18.
//  Copyright © 2019 ShenYj. All rights reserved.
//

#import "SYJNavigationBar.h"

@interface SYJNavigationBar ()

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation SYJNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    for (UIView *view in self.subviews) {
        if (systemVersion >= 11.0) {
            if ([view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                //                NSLog(@"_UIBarBackground");
                CGRect frame = view.frame;
                frame.size.height = 64;
                if (IS_IPHONE_PROFILED_FULL_SCREEN) {
                    frame.origin.y = 24;
                }
                view.frame = frame;
                //                NSLog(@"修改后的Frame: %@",NSStringFromCGRect(view.frame));
            }
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
                //                NSLog(@"_UINavigationBarContentView");
                CGRect frame = view.frame;
                frame.origin.y = 20;
                if (IS_IPHONE_PROFILED_FULL_SCREEN) {
                    frame.origin.y = 44;
                }
                view.frame = frame;
            }
        }
    }
}


#pragma mark -
#pragma mark - lazy

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        NSString *imageName = [[NSBundle mainBundle] pathForResource:@"navigation_bar_back" ofType:@"png"];
        NSString *imageNameHighlight = [[NSBundle mainBundle] pathForResource:@"navigation_bar_back_highlight" ofType:@"png"];
        [_backButton setImage:[UIImage imageWithContentsOfFile:imageName] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageWithContentsOfFile:imageNameHighlight] forState:UIControlStateHighlighted];
    }
    return _backButton;
}

@end
