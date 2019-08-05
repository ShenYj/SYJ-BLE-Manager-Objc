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
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


// 菜单跳转
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    UITabBarController *tabBarVC = (UITabBarController *)self.window.rootViewController;
    
    /*
     *  方式one - localizedTitle
     if ([shortcutItem.localizedTitle isEqualToString:@"时尚之都"]) {
     tabBarVC.selectedIndex = 0;
     }else if ([shortcutItem.localizedTitle isEqualToString:@"知识海洋"]){ //知识海洋
     tabBarVC.selectedIndex = 1;
     }else{
     tabBarVC.selectedIndex = 2; //联系的人
     }
     */
    
    //方式two - type
    if ([shortcutItem.type isEqualToString:@"movie"]) { //时尚之都
        tabBarVC.selectedIndex = 0;
    }else if ([shortcutItem.type isEqualToString:@"book"]){ //知识海洋
        tabBarVC.selectedIndex = 1;
    }else{
        tabBarVC.selectedIndex = 2; //联系的人
    }
}

@end
