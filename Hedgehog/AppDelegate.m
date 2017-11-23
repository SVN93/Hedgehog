//
//  AppDelegate.m
//  Hedgehog
//
//  Created by Vladislav Solovyov on 23/11/2017.
//

#import "AppDelegate.h"
#import "HGHRootViewController.h"

@interface AppDelegate () {
    HGHRootViewController *_rootVC;
    UINavigationController *_rootNavigationController;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _rootVC = [HGHRootViewController new];
    _rootNavigationController = [[UINavigationController alloc] initWithRootViewController:_rootVC];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = _rootNavigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
