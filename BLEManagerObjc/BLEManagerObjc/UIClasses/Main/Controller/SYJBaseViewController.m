//
//  SYJBaseViewController.m
//  BLEManagerObjc
//
//  Created by ShenYj on 2019/7/18.
//  Copyright © 2019 ShenYj. All rights reserved.
//

#import "SYJNavigationBar.h"
#import "SYJBaseViewController.h"

#define NAVIGATION_BAR_BACKGROUND_COLOUR [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0]

@interface SYJBaseViewController ()

@end

@implementation SYJBaseViewController

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self calculateNavigationBarHeight];
    [self prepareCustomNavigationBar];
    [self prepareBaseView];
    
    // 开启和监听 设备旋转的通知
    if (![UIDevice currentDevice].generatesDeviceOrientationNotifications) {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    }
    if (@available(iOS 13.0, *)) {
        _isPortrait = ![UIApplication sharedApplication].keyWindow.windowScene.interfaceOrientation;
    } else {
        // Fallback on earlier versions
        _isPortrait = !UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    }
    
    // 监听设备朝向变化
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(orientationDidChangeNotification:)
                                                 name: UIDeviceOrientationDidChangeNotification
                                               object: nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIDeviceOrientationDidChangeNotification
                                                  object: nil];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

#pragma mark
#pragma mark - set up UI

- (void)setNavigationBarHeight:(CGFloat)navigationBarHeight
{
    if (_navigationBarHeight != navigationBarHeight) {
        _navigationBarHeight = navigationBarHeight;
        [self calculateNavigationBarHeight];
    }
}

- (void)calculateNavigationBarHeight
{
    if (!self.navigationBarHeight) {
        CGFloat statusBarHeight = 0;
        if (@available(iOS 13.0, *)) {
            statusBarHeight = [UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame.size.height;
        } else {
            // Fallback on earlier versions
            statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
        }
        CGFloat navigationBarH = 44;
        if (IS_IPHONE_PROFILED_FULL_SCREEN) {
            navigationBarH = 44;
        }
        _navigationBarHeight = statusBarHeight + navigationBarH;
    }
    //    _navigationBarHeight = (CGRectIsEmpty(frame) || CGRectIsNull(frame)) ? (statusBarHeight + navigationBarHeight) : frame.size.height;
    //    NSLog(@"%@", [NSString stringWithFormat:@"导航栏整体高度: %f (状态栏+导航条)", self.navigationBarHeight]);
}

- (void)prepareBaseView
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES];
}

/** 设置标题 */
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.syj_navigationItem.title = title;
}
/** 导航条视图 */
- (void)prepareCustomNavigationBar
{
    [self.view addSubview:self.syj_navigationBar];
    self.syj_navigationBar.items = @[self.syj_navigationItem];
    self.syj_navigationBar.barTintColor = self.syj_navigationBar.backgroundColor;
    [self.syj_navigationBar setTitleTextAttributes:@{
                                                     NSFontAttributeName: [UIFont systemFontOfSize:18],
                                                     NSForegroundColorAttributeName: [UIColor orangeColor]}];
    
    
    //#ifdef DEBUG
    //    NSLog(@"cell recursive description:\n\n%@\n\n",[self.syj_navigationBar performSelector:@selector(recursiveDescription)]);
    //    NSLog(@"%@", [self performSelector:@selector(_printHierarchy)]);
    //#endif
    
    
}

#pragma mark
#pragma mark - 朝向发生变化

- (void)orientationDidChangeNotification:(NSNotification *)notification
{
    if ( [UIDevice currentDevice].orientation == UIDeviceOrientationUnknown) {
        return;
    }
    BOOL isPortrait = UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation);
    //    BOOL isLandscape = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation);
    _isPortrait = isPortrait;
    NSLog(@"(orientationDidChangeNotification)变化后：%@", _isPortrait ? @"竖屏" : @"横屏");
    self.syj_navigationBar.frame = ({
        CGRect rect = self.syj_navigationBar.frame;
        rect.size.width = SCREEN_WIDTH;
        rect;
    });
}



#pragma mark
#pragma mark - lazy

- (SYJNavigationBar *)syj_navigationBar {
    if (!_syj_navigationBar) {
        _syj_navigationBar = [[SYJNavigationBar alloc] initWithFrame:CGRectMake(0,  0, [UIScreen mainScreen].bounds.size.width, _navigationBarHeight)];
        _syj_navigationBar.backgroundColor = NAVIGATION_BAR_BACKGROUND_COLOUR;
    }
    return _syj_navigationBar;
}

- (UINavigationItem *)syj_navigationItem {
    if (!_syj_navigationItem) {
        _syj_navigationItem = [[UINavigationItem alloc] init];
    }
    return _syj_navigationItem;
}


@end
