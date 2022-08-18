//
//  ProfileViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 03.08.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
    }
    
    // MARK: UI Setup -
    
    private func setupAppearence() {
        navigationItem.title = "Профиль"
    }
}
