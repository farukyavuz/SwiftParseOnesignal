//
//  AppDelegate.swift
//  PushTestClone
//
//  Created by Faruk Yavuz on 24.01.2018.
//  Copyright © 2018 Faruk Yavuz. All rights reserved.
//

import UIKit
import Parse
//import OneSignal

//http://ec2-52-91-114-234.compute-1.amazonaws.com/apps
//user
//61hfy9LGU1TA
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
//
//        //ONESIGNAL
//        OneSignal.initWithLaunchOptions(launchOptions,
//                                        appId: "a920b83d-1496-4797-8f13-a866263afd64",
//                                        handleNotificationAction: nil,
//                                        settings: onesignalInitSettings)
//
//        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
//
//        // Recommend moving the below line to prompt for push after informing the user about
//        // how your app will use them.
//        OneSignal.promptForPushNotifications(userResponse: { accepted in
//            print("User accepted notifications: \(accepted)")
//        })
//
//        // Sync hashed email if you have a login system or collect it.
//        //   Will be used to reach the user at the most optimal time of day.
//        // OneSignal.syncHashedEmail(userEmail)
        
        
        rememberUser()
        
        let config = ParseClientConfiguration { (ParseMutableClientConfiguration) in
            ParseMutableClientConfiguration.applicationId = "2fd942f1ffef86596c0c6a463ba7e734408e814a"
            ParseMutableClientConfiguration.clientKey = "06b5614e3c96df4d707e0bb39637c0f4b3989871"
            ParseMutableClientConfiguration.server = "http://52.91.114.234:80/parse"
        }
        Parse.initialize(with: config)
        let defaultACL = PFACL()
        defaultACL.getPublicReadAccess = true
        defaultACL.getPublicWriteAccess = true
        PFACL.setDefault(defaultACL, withAccessForCurrentUser: true)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func rememberUser() {
        
        let user : String? = UserDefaults.standard.string(forKey: "username")
        
        if user != nil {
            let board : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let tabBar = board.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
            window?.rootViewController = tabBar
        }
        
    }
}
