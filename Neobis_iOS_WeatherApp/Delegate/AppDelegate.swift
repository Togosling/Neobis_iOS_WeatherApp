//
//  AppDelegate.swift
//  Neobis_iOS_WeatherApp
//
//  Created by Тагай Абдылдаев on 14/4/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator : AppCoordinator?
    
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         window = UIWindow(frame: UIScreen.main.bounds)
         let navigationCon = BaseNavigationController.init()
         appCoordinator = AppCoordinator(navCon: navigationCon)
         appCoordinator!.start()
         window!.rootViewController = navigationCon
         window!.makeKeyAndVisible()
         return true
     }
}

