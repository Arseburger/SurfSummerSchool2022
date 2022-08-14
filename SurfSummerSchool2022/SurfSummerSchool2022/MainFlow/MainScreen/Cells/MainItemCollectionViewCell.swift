//
//  MainItemCollectionViewCell.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 10.08.2022.
//

import UIKit

// MARK: Constants -

private enum Images {
    static let heartEmpty = UIImage(named: "heartEmpty")
    static let heartFilled = UIImage(named: "heartFilled")
}

class MainItemCollectionViewCell: UICollectionViewCell {

    // MARK: Views -
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var isFavoriteButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Events -
    
    var didPressFavoriteButton: ((Bool) -> Void)?
    
    // MARK: Private Properies -
    
    private var isFavorite: Bool = false {
        didSet {
            isFavoriteButton.setImage(isFavorite ? Images.heartFilled : Images.heartEmpty, for: .normal)
        }
    }
    
    // MARK: Setup -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearence()
    }
    
    func configure(with item: ItemModel) {
        imageView.image = item.image
        titleLabel.text = item.title
        self.isFavorite = item.isFavorite
    }
    
    override func prepareForReuse() {
        configure(with: ItemModel.defaultItem)
    }
    
    // MARK: Actions -
    
    @IBAction private func favoriteButtonPressed(_ sender: Any) {
        isFavorite.toggle()
        self.didPressFavoriteButton?(isFavorite)
    }
}

// MARK: Private Methods -

extension MainItemCollectionViewCell {
    
    func setupAppearence() {
        imageView.layer.cornerRadius = 12
        isFavoriteButton.tintColor = Colors.favoriteButton
    }
}
