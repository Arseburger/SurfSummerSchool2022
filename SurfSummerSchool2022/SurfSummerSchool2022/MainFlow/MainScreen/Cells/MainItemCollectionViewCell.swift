//
//  MainItemCollectionViewCell.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 10.08.2022.
//

import UIKit

class MainItemCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isFavoriteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Events
    
    var updateFavorite: (Bool) -> Void = { _ in }
    
    // MARK: - Private Properies
    
    private var isFavorite: Bool = false {
        didSet {
            isFavoriteButton.setImage(
                isFavorite ?
                    .init(named: "heartFilled") :
                    .init(named: "heartEmpty"),
                for: .normal)
        }
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
    }
    
    // MARK: - Data Fillment
    
    func configure(with item: ItemModel) {
        imageView.image = item.image
        titleLabel.text = item.title
        self.isFavorite = item.isFavorite
    }
    
    // MARK: - @IBActions
    
    @IBAction private func favoriteButtonPressed(_ sender: Any) {
        self.updateFavorite(isFavorite)
    }
    
}
