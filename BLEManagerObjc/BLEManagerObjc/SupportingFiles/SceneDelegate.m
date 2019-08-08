#import "SceneDelegate.h"
#import "SYJHomeViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions
#pragma clang pop
{
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    SYJHomeViewController *rootVC = [[SYJHomeViewController alloc] init];
    SYJNavigationController *rootTabController = [[SYJNavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = rootTabController;
    [self.window makeKeyAndVisible];
}
#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (void)sceneDidDisconnect:(UIScene *)scene
#pragma clang pop
{
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}

#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (void)sceneDidBecomeActive:(UIScene *)scene
#pragma clang pop
{
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (void)sceneWillResignActive:(UIScene *)scene
#pragma clang pop
{
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (void)sceneWillEnterForeground:(UIScene *)scene
#pragma clang pop
{
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (void)sceneDidEnterBackground:(UIScene *)scene
#pragma clang pop
{
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


#pragma mark - System Integration
// Called when the user activates your application by selecting a shortcut on the home screen,
// and the window scene is already connected.
#pragma clang push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
- (void)windowScene:(UIWindowScene *)windowScene performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
#pragma clang pop
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

// Called after the user indicates they want to accept a CloudKit sharing invitation in your application
// and the window scene is already connected.
// You should use the CKShareMetadata object's shareURL and containerIdentifier to schedule a CKAcceptSharesOperation, then start using
// the resulting CKShare and its associated record(s), which will appear in the CKContainer's shared database in a zone matching that of the record's owner.
- (void)windowScene:(UIWindowScene *)windowScene userDidAcceptCloudKitShareWithMetadata:(CKShareMetadata *)cloudKitShareMetadata
{
    
}

@end
