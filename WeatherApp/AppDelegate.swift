//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
     
        let navigation = UINavigationController()
        let viewController = HomeAssembler().provide(view: navigation)
        navigation.setViewControllers([viewController], animated: true)
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        return true
    }
}

