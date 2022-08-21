//
//  FavoriteViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 03.08.2022.
//

import UIKit

final class FavoriteViewController: UIViewController {

    // MARK: Views -
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Private Properties -
    
    private var items: [DetailItemModel] = Array(repeating: .defaultItem, count: 3)
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
        for i in 0 ..< items.count {
            items[i].isFavorite = true
        }
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: UI Setup -

private extension FavoriteViewController {
    
    func setupAppearence() {
        navigationItem.title = "Избранное"
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        addNavigationBarSearchButton()
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "FavoriteTableViewCell", bundle: .main), forCellReuseIdentifier: "FavoriteTableViewCell")
        tableView.contentInset = .init(top: 8.0, left: 0.0, bottom: 0.0, right: 0.0)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.reloadData()
    }
}

// MARK: Table View Data Source -

extension FavoriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as? FavoriteTableViewCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        
        cell.configure(with: items[indexPath.row])
        cell.didPressFavoriteButton = { [weak self] in
            let actions: AlertActions = (
                UIAlertAction(
                    title: "Да, точно",
                    style: .default,
                    handler: { _ in
                        if let index = tableView.indexPath(for: cell) {
                            guard let self = self else { return }
                            self.items.remove(at: index.row)
                            self.tableView.deleteRows(at: [index], with: .fade)
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                ),
                UIAlertAction(
                    title: "Нет",
                    style: .default,
                    handler: { _ in
                        self?.dismiss(animated: true, completion: nil)
                    }
                )
            )
            if let alert = self?.createAlert(message: "Вы точно хотите удалить из избранного?", actions: actions) {
                self?.present(alert, animated: true, completion: nil)
            }
        }
        
        return cell
    }
}

// MARK: Table View Delegate

extension FavoriteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
