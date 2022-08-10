//
//  TabBarConfigurator.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 03.08.2022.
//

import Foundation
import UIKit

final class TabBarConfigurator {
    
    // MARK: - Private Properties
    
    private let allTabs: [TabBarModel] = [.main, .favorite, .profile]
    
    // MARK: - Internal Methods
    
    func configure() -> UITabBarController {
        return getTabBarController()
    }
    
}

// MARK: Private Methods

private extension TabBarConfigurator {
    
    func getTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.unselectedItemTintColor = .lightGray
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.viewControllers = getViewControllers()
        return tabBarController
    }
    
    func getViewControllers() -> [UIViewController] {
        var viewControllers = [UIViewController]()
        
        allTabs.forEach { tab in
            let controller = getController(by: tab)
            let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
            controller.tabBarItem = tabBarItem
            let navigationController = UINavigationController(rootViewController: controller)
            viewControllers.append(navigationController)
        }
        return viewControllers
    }
    
    func getController(by tab: TabBarModel) -> UIViewController {
        switch tab {
            case .main:
                return MainViewController()
            case .favorite:
                return FavoriteViewController()
            case .profile:
                return ProfileViewController()
        }
    }
}
