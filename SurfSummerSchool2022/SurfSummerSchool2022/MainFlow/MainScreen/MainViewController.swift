//
//  MainViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 03.08.2022.
//

import UIKit

// MARK: Constants -

private enum Constants {
    static let interItemSpacing = 7.0
    static let lineSpacing = 8.0
    static let vPadding = 10.0
    static let hPadding = 16.0
}

final class MainViewController: UIViewController {

    // MARK: Views -
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: Private Properties -
    
    private let model: MainModel = MainModel()
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
        setupCollectionView()
        model.getPosts()
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: Setup Methods -

private extension MainViewController {
    
    func setupAppearence() {
        navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Главная"
        navigationItem.backButtonTitle = ""
        addNavigationBarSearchButton()
    }
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "MainItemCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MainItemCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.contentInset = UIEdgeInsets(
            top: Constants.vPadding,
            left: Constants.hPadding,
            bottom: Constants.vPadding,
            right: Constants.hPadding
        )
    }
}

// MARK: Collection View Data Source -

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainItemCollectionViewCell", for: indexPath) as? MainItemCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: model.items[indexPath.item])
        cell.didPressFavoriteButton = { [weak self] isFavorite in
            self?.model.items[indexPath.item].isFavorite = isFavorite
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: Collection View Layout Delegate -

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (view.frame.width - 2.0 * Constants.hPadding - Constants.interItemSpacing) / 2.0
        return .init(width: itemWidth, height: itemWidth * 1.46)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constants.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.interItemSpacing
    }
}
