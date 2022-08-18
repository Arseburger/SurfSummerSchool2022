//
//  DetailViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 16.08.2022.
//

import UIKit

final class DetailViewController: UIViewController, UITableViewDelegate, UIGestureRecognizerDelegate {

    // MARK: Views -
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Private Properties -
    
    private var detailItem: DetailItemModel = .defaultItem
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupAppearence()
    }
}

// MARK: Private Methods -

private extension DetailViewController {
    
    func setupAppearence() {
        navigationItem.title = detailItem.title
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        addNavigationBarSearchButton()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "DetailTableViewCell", bundle: .main), forCellReuseIdentifier: "DetailTableViewCell")
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: Table View Data Source -

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: self.detailItem)
        return cell
    }
}
