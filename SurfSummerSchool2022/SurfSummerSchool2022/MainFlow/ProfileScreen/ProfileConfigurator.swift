//
//  ProfileConfigurator.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 15.08.2022.
//

import Foundation
import UIKit

struct UserModel {
    let name: String
    let bio: String
    let picture: UIImage?
    let city: String
    let phoneNumber: String
    let email: String
    
    static let defaultUser = UserModel(
        name: "Александра Новикова",
        bio: "«Светлое будущее живет в вечности»",
        picture: UIImage(named: "defaultUser"),
        city: "Санкт-Петербург",
        phoneNumber: "+ 7 (961) 187 17 44",
        email: "alexandra@surfstudio.ru"
    )
}

struct SingleField {
    let name: String
    var value: String
}

enum CellType {
    case main(_ item: UserModel)
    case singleField(_ item: SingleField)
}

final class ProfileConfigurator {

    // MARK: Properties -
    
    var cells: [CellType] = []
    
    // MARK: Setup -
    
    convenience init(user: UserModel) {
        self.init()
        self.cells = [
            .main(user),
            .singleField(
                SingleField(
                    name: "Город",
                    value: user.city)
            ),
            .singleField(
                SingleField(
                    name: "Телефон",
                    value: user.phoneNumber)
            ),
            .singleField(
                SingleField(
                    name: "Почта",
                    value: user.email)
            )
        ]
    }
}
