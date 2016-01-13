//
//  AppDelegate.swift
//  Foam Factions
//
//  Created by Cameron Bavier on 1/7/16.
//  Copyright © 2016 Cameron Bavier. All rights reserved.
//

import UIKit
import Parse
import Bolts
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
 
    UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    
    initializeTabBar()
    initializeParse(launchOptions)
    IQKeyboardManager.sharedManager().enable = true
    
    return true
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

  func initializeTabBar() {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    // TODO: Create featured tab with current events for user
    //    let homeVC = HomeViewController(nibName: nil, bundle: nil)
    //    let homeNav = CBNavigationController()
    //    homeNav.viewControllers = [homeVC]
    //    homeNav.tabBarItem = UITabBarItem(title: "Featured", image: UIImage.init(named: "featured"), tag: 0)
    
    // Game Type Navigation and View Controller Setup
    let gameTypeVC = GameTypeViewController(nibName: nil, bundle: nil)
    let gameTypeNav = CBNavigationController()
    gameTypeNav.viewControllers = [gameTypeVC]
    gameTypeNav.tabBarItem = UITabBarItem(title: "Game Types", image: UIImage.init(named: "game"), tag: 1)
    
    // Groups Navigation and View Controller Setup
    let groupsVC = GroupsViewController(nibName: nil, bundle: nil)
    let groupsNav = CBNavigationController()
    groupsNav.viewControllers = [groupsVC]
    groupsNav.tabBarItem = UITabBarItem(title: "Groups", image: UIImage.init(named: "group"), tag: 1)
    
    // My Profile Navigation and View Controller Setup
    let storyboard = UIStoryboard(name: "MyProfile", bundle: nil)
    let controller = storyboard.instantiateInitialViewController()! as UIViewController
    let myProfileNav = CBNavigationController()
    myProfileNav.viewControllers = [controller]
    myProfileNav.tabBarItem = UITabBarItem(title: "My Profile", image: UIImage.init(named: "profile"), tag: 1)
    
    // Tab Bar Controller setup
    let tabs = UITabBarController()
    tabs.tabBar.tintColor = UIColor.init(colorLiteralRed: 33/255.0, green: 150/255.0, blue: 243/255.0, alpha: 1.0)
    tabs.viewControllers = [gameTypeNav, groupsNav, myProfileNav]
    tabs.tabBar.translucent = false
    
    self.window!.rootViewController = tabs;
    self.window?.makeKeyAndVisible();
  }

  func initializeParse(launchOptions: [NSObject: AnyObject]?) {
    Parse.enableLocalDatastore()
    Parse.setApplicationId("wAyQ3kthP3HGWx3YcIm3dNAXhNK8IKVwtrmRxzA3",
      clientKey: "COnwwP3bD9BX8iKEPk8FgJfagwBApoAHSXuISTNm")
    PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
  }
  
}

