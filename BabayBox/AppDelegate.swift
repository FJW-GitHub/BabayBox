//
//  AppDelegate.swift
//  BabayBox
//
//  Created by xiaofu on 16/4/5.
//  Copyright © 2016年 xiaofu. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       window = UIWindow.init(frame: UIScreen.mainScreen().bounds)
        window!.makeKeyAndVisible()
        createTabbarController()
        return true
    }
    func createTabbarController(){
        
        let iconList = ["识","画","我"]
        let tab = UITabBarController.init()
        tab.viewControllers = [UINavigationController.init(rootViewController:
            LearnViewController.init()),UINavigationController.init(rootViewController:
            PaintingViewController.init()),UINavigationController.init(rootViewController:
            UserViewController.init())]
        for index in 0 ..< 3 {
            tab.viewControllers![index].tabBarItem.title = iconList[index]
            tab.viewControllers![index].tabBarItem.image = UIImage.init(named: iconList[index])
        }
        window!.rootViewController = tab
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

