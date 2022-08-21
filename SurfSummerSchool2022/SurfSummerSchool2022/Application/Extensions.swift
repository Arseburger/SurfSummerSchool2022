//
//  Extensions.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 18.08.2022.
//

import Foundation
import UIKit

// MARK: UIViewController -

extension UIViewController {
    
    public typealias AlertActions = (confirm: UIAlertAction, decline: UIAlertAction)
    
    func addNavigationBarSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "searchIcon"),
            style: .plain,
            target: self,
            action: #selector(searchButtonPressed)
        )
    }
    
    func createAlert(title: String = "Внимание", message: String, actions: AlertActions) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = actions.confirm
        let declineAction = actions.decline
        alert.addAction(declineAction)
        alert.addAction(confirmAction)
        alert.preferredAction = confirmAction
        return alert
    }
    
    @objc
    fileprivate func searchButtonPressed() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
}

// MARK: UINavigationController -

extension UINavigationController {
    
    func setupAppearence() {
        navigationBar.backIndicatorImage = UIImage(named: "backArrowIcon")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backArrowIcon")
        navigationBar.titleTextAttributes = [.font : Fonts.SFProText.semibold?.withSize(17.0) ?? .systemFont(ofSize: 17.0, weight: .semibold)]
    }
}
