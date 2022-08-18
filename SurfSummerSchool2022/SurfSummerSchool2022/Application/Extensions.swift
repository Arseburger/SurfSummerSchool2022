//
//  Extensions.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 18.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func addNavigationBarSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "searchIcon"),
            style: .plain,
            target: self,
            action: #selector(searchButtonPressed)
        )
    }
    
    @objc
    private func searchButtonPressed() {
        let searchVC = SearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
}

extension UINavigationController {
    func setupAppearence() {
        navigationBar.backIndicatorImage = UIImage(named: "backArrowIcon")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backArrowIcon")
        navigationBar.titleTextAttributes = [.font : Fonts.SFProText.semibold?.withSize(17.0) ?? .systemFont(ofSize: 17.0, weight: .semibold)]
    }
}
