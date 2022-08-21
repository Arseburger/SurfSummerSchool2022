//
//  AppDelegate.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 03.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        
//        runMainFlow()
        runAuthorizationFlow()
        
        return true
    }

    func runMainFlow() {
        let vc = TabBarConfigurator().configure()
        window?.rootViewController = vc
    }
    
    func runAuthorizationFlow() {
        let vc = AuthorizationViewController()
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
}
