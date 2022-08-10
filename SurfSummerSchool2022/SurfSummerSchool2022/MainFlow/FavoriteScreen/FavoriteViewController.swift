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
        
        configureAppearence()
    }

    private func configureAppearence() {
        navigationItem.title = "Избранное"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "searchIcon"),
            style: .plain,
            target: self,
            action: #selector(searchButtonTapped)
        )
    }
    
    @objc
    private func searchButtonTapped() {
    }
    
}
