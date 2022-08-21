//
//  SingleFieldTableViewCell.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 15.08.2022.
//

import UIKit

class SingleFieldTableViewCell: UITableViewCell {

    // MARK: Veiws -
    
    @IBOutlet private weak var fieldNameLabel: UILabel!
    @IBOutlet private weak var fieldValueLabel: UILabel!
    
    // MARK: Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearence()
    }
    
    func configure(with item: SingleField) {
        fieldNameLabel.text = item.name
        fieldValueLabel.text = item.value
    }
    
    private func setupAppearence() {
        fieldNameLabel.font = Fonts.SFProText.regular?.withSize(12.0)
        fieldNameLabel.textColor = Colors.secondaryLabel
        
        fieldValueLabel.font = Fonts.SFProText.regular?.withSize(18.0)
    }
}
