//
//  AppDelegate.m
//  ACCamera
//
//  Created by Guo Xuelei on 2016/12/3.
//  Copyright © 2016年 Zhanggf. All rights reserved.
//

#import "AppDelegate.h"
#import "ACRootVC.h"

@interface AppDelegate ()

@property (nonatomic, strong) ACRootVC *homeVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _rootController = [[ACRootVC alloc] init];
    _navController = [[UINavigationController alloc] initWithRootViewController:_rootController];
    //_navController.navigationBarHidden = YES;
    _window.rootViewController = _navController;
    [_window makeKeyAndVisible];
    [self configNav];
    return YES;
}

- (void)configNav {
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [[UINavigationBar appearance] setBarTintColor:[UIColor themeColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    //[[UITableViewCell appearance] setBackgroundColor:[UIColor clearColor]];
    //[[UITableView appearance] setSectionIndexColor:[UIColor grayColor]];
    //[[UITableView appearance] setSectionIndexBackgroundColor:[UIColor clearColor]];
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName, shadow, NSShadowAttributeName, [UIFont systemFontOfSize:19], NSFontAttributeName, nil]];
}

- (void)showHomeController {
    if (!_homeVC) {
        _homeVC = [[ACRootVC alloc] init];
    }
    self.window.rootViewController = _homeVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
