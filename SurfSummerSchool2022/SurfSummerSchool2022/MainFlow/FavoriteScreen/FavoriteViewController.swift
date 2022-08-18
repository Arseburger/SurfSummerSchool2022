//
//  FavoriteViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 03.08.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: UI Setup -

    private func setupAppearence() {
        navigationItem.title = "Избранное"
        navigationController?.navigationBar.tintColor = .black
        addNavigationBarSearchButton()
    }
}
