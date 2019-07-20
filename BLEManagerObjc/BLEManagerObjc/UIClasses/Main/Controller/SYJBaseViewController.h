//
//  SYJBaseViewController.h
//  BLEManagerObjc
//
//  Created by ShenYj on 2019/7/18.
//  Copyright © 2019 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SYJNavigationBar;
@interface SYJBaseViewController : UIViewController

/** 自定义导航条 */
@property (nonatomic,strong) SYJNavigationBar *syj_navigationBar;
/** 自定义导航条Item */
@property (nonatomic,strong) UINavigationItem *syj_navigationItem;

@property (nonatomic, assign, getter=syj_navigationBarHeight) CGFloat navigationBarHeight;
/// 当前手机朝向， 是竖屏还是横屏
@property (nonatomic, assign, readonly) BOOL isPortrait;

@end

NS_ASSUME_NONNULL_END
