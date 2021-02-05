//
//  AppDelegate.swift
//  countDownTimer
//
//  Created by 細川聖矢 on 2021/02/02.
//

import UIKit
import GoogleMobileAds

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
//    var backgroundTaskID:UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //バックグランド遷移後
//    func applicationWillResignActive(_ application: UIApplication) {
//        self.backgroundTaskID = application.beginBackgroundTask(){
//            [weak self] in
//            application.endBackgroundTask((self?.backgroundTaskID)!)
//            self?.backgroundTaskID = UIBackgroundTaskIdentifier.invalid
//        }
//    }
    
    //アプリがアクティブになった時
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        application.endBackgroundTask(self.backgroundTaskID)
//    }

}

