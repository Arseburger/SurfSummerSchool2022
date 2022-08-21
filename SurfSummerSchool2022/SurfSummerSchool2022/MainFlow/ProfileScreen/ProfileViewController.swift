//
//  ProfileViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 03.08.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: Views -
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Private Properties -
    
    private let configurator = ProfileConfigurator(user: UserModel.defaultUser)
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
        configureTableView()
    }

    // MARK: Actions -
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Внимание", message: "Вы точно хотите выйти из приложения?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Да, точно", style: .default, handler: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        })
        let declineAction = UIAlertAction(title: "Нет", style: .default, handler: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        })
        alert.addAction(declineAction)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: Private Methods -

private extension ProfileViewController {

    func setupAppearence() {
        navigationItem.title = "Профиль"
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: .main), forCellReuseIdentifier: "MainTableViewCell")
        tableView.register(UINib(nibName: "SingleFieldTableViewCell", bundle: .main), forCellReuseIdentifier: "SingleFieldTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        tableView.reloadData()
    }
}

// MARK: Table View Data Source -

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        configurator.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch configurator.cells[indexPath.row] {
            case .main(let user):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as? MainTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(with: user)
                return cell
            case .singleField(let field):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "SingleFieldTableViewCell") as? SingleFieldTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(with: field)
                return cell
        }
    }
}

// MARK: Table View Delegate -

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160.0
        } else {
            return 72.0
        }
    }
}
