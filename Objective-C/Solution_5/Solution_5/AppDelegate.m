//
//  AppDelegate.m
//  Solution_5
//
//  Created by Николай Чупреев on 25.01.2024.
//

#import "AppDelegate.h"
//
#import "ViewController.h"


@implementation AppDelegate

// Изначально для отображения ViewController использовал этот вариант. Но для перехода на SecondViewController не работает. Необходимо использовать эти настройки в @implementation SceneDelegate
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    ViewController *viewController = [[ViewController alloc] init];
//    UINavigationController *navigationController =
//    [[UINavigationController alloc]
//     initWithRootViewController:viewController];
//      [self.window setRootViewController:navigationController];
//    // Устанавливаем navigationController в качестве корневого
////    self.window.rootViewController = navigationController;
//    [self.window makeKeyAndVisible];
    return YES;
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


@end
