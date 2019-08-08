//
//  AppDelegate.m
//  BLEManagerObjc
//
//  Created by ShenYj on 2019/7/16.
//  Copyright © 2019 ShenYj. All rights reserved.
//

#import "AppDelegate.h"
#import "SYJHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    if (IOS_VERSION < 13.0) {
        SYJHomeViewController *rootVC = [[SYJHomeViewController alloc] init];
        SYJNavigationController *rootTabController = [[SYJNavigationController alloc] initWithRootViewController:rootVC];
        self.window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];
        self.window.rootViewController = rootTabController;
        [self.window makeKeyAndVisible];
    }
    
    // ShortcutIcon
    [self initShortcutItems:[UIApplication sharedApplication]];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - UISceneSession lifecycle

#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options
#pragma clang pop
{
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions
{
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (void)initShortcutItems:(UIApplication *)application
{
    UIApplicationShortcutIcon *search = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutItem *searchItem = [[UIApplicationShortcutItem alloc] initWithType:@"BLE_SCAN"
                                                                             localizedTitle:NSLocalizedString(@"BLE_OPT_SCAN", @"搜索蓝牙")
                                                                          localizedSubtitle:nil
                                                                                       icon:search
                                                                                   userInfo:nil];
    
    UIApplicationShortcutIcon *complete = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeTaskCompleted];
    UIApplicationShortcutItem *stopSearchItem = [[UIApplicationShortcutItem alloc] initWithType:@"BLE_SCAN_STOP"
                                                                                 localizedTitle:NSLocalizedString(@"BLE_OPT_SCAN_STOP", @"停止搜索蓝牙")
                                                                              localizedSubtitle:nil
                                                                                           icon:complete
                                                                                       userInfo:nil];
    application.shortcutItems = @[searchItem, stopSearchItem];
}

// 菜单跳转
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    SYJNavigationController *rootNav = (SYJNavigationController *)self.window.rootViewController;
#pragma clang diagnostic pop
    if ([shortcutItem.type isEqualToString:@"BLE_SCAN"]) { //时尚之都
        NSLog(@"BLE_SCAN");
    }
    else if ([shortcutItem.type isEqualToString:@"BLE_SCAN_STOP"]) {
        NSLog(@"BLE_SCAN_STOP");
    }
    else {
        
    }
}

@end
