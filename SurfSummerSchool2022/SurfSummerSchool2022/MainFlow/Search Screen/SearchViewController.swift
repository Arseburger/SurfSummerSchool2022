//
//  SearchViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 15.08.2022.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
