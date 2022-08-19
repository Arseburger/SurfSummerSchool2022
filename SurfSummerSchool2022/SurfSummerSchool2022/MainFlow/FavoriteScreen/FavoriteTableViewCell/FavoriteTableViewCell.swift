//
//  FavoriteTableViewCell.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 18.08.2022.
//

import UIKit

// MARK: Constants -

private enum Images {
    static let heartEmpty = UIImage(named: "heartEmpty")
    static let heartFilled = UIImage(named: "heartFilled")
}

final class FavoriteTableViewCell: UITableViewCell {

    // MARK: Views -
    
    @IBOutlet private weak var pictureView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var creationDateLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var isFavoriteButton: UIButton!
    
    // MARK: Events -
    
    var didPressFavoriteButton: (() -> Void)?
    
    // MARK: Private Properties -
    
    private var isFavorite: Bool = true {
        didSet {
            isFavoriteButton.setImage(isFavorite ? Images.heartFilled : Images.heartEmpty, for: .normal)
        }
    }
    
    // MARK: Setup -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearence()
    }
    
    private func setupAppearence() {
        pictureView.layer.cornerRadius = 12.0
        isFavoriteButton.tintColor = Colors.favoriteButton
        creationDateLabel.textColor = Colors.secondaryLabel
    }
    
    func configure(with item: DetailItemModel) {
        pictureView.image = item.image
        titleLabel.text = item.title
        creationDateLabel.text = item.creationDate
        descriptionLabel.text = item.description
        self.isFavorite = item.isFavorite
    }
    
    // MARK: Actions -
    
    @IBAction func favoriteButtonPressed(_ sender: Any) {
        didPressFavoriteButton?()
    }
}
