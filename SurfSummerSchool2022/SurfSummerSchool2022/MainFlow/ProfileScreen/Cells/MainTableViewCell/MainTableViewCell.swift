//
//  MainTableViewCell.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 15.08.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    // MARK: Views -
    
    @IBOutlet private weak var userPicture: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userBioLabel: UILabel!
    
    // MARK: Setup -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearence()
    }
    
    private func setupAppearence() {
        userPicture.layer.cornerRadius = 12
        userBioLabel.textColor = Colors.userBio
    }
    
    func configure(with user: UserModel) {
        userPicture.image = user.picture
        userNameLabel.text = user.name
        userBioLabel.text = user.bio
    }
}

