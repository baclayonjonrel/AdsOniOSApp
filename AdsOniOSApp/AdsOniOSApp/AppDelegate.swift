//
//  AppDelegate.swift
//  AdsOniOSApp
//
//  Created by Jonrel Baclayon on 7/27/24.
//

import UIKit
import GoogleMobileAds

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        AppOpenAdManager.shared.loadAd()
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

    func applicationDidBecomeActive(_ application: UIApplication) {
        let rootViewController: UIViewController?
        
        if #available(iOS 13.0, *) {
            rootViewController = UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap { $0 as? UIWindowScene }
                .first?.windows
                .filter { $0.isKeyWindow }
                .first?.rootViewController
        } else {
            rootViewController = application.windows.first { $0.isKeyWindow }?.rootViewController
        }
        
        if let rootViewController = rootViewController {
            // Do not show open ad if current view controller is SplashViewController
            if rootViewController is SplashViewController {
                return
            }
            AppOpenAdManager.shared.showAdIfAvailable(viewController: rootViewController)
        }
    }


}

