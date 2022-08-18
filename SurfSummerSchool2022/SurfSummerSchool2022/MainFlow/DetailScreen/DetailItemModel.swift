//
//  DetailItemModel.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 16.08.2022.
//

import Foundation
import UIKit

struct DetailItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let description: String
    let creationDate: String
    
    static let defaultItem: DetailItemModel = .init(
        image: UIImage(named: "defaultImage"),
        title: "Чашечка свежего кофе",
        isFavorite: false,
        description: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \nТеперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта",
        creationDate: "12.05.2022"
    )
}
