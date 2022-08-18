//
//  DetailTableViewCell.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 16.08.2022.
//

import UIKit

final class DetailTableViewCell: UITableViewCell {

    // MARK: Views -
    
    @IBOutlet private weak var pictureView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var creationDateLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    // MARK: Setup -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearence()
    }

    func configure(with item: DetailItemModel) {
        pictureView.image = item.image
        titleLabel.text = item.title
        creationDateLabel.text = item.creationDate
        descriptionTextView.attributedText = makeAttributedText(from: item.description)
    }
    
    private func setupAppearence() {
        pictureView.layer.cornerRadius = 12.0
        titleLabel.textColor = .black
        creationDateLabel.textColor = Colors.secondaryLabel
        descriptionTextView.isScrollEnabled = false
        descriptionTextView.textContainer.lineFragmentPadding = 0
    }
    
    private func makeAttributedText(from string: String) -> NSAttributedString {
        let style: NSMutableParagraphStyle = .init()
        style.paragraphSpacing = 16
        style.lineSpacing = 5
        style.lineHeightMultiple = 1.2
        return NSAttributedString(string: string, attributes: [.paragraphStyle : style])
    }
}
