//
//  MainModel.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 10.08.2022.
//

import Foundation
import UIKit

final class MainModel {
    
    // MARK: Events -
    var didUpdateItems: (() -> Void)?
    
    // MARK: Properties -
    
    var items: [ItemModel] = [] {
        didSet {
            didUpdateItems?()
        }
    }
    
    // MARK: Methods -
    
    func getPosts() {
        items = Array(repeating: .defaultItem, count: 50)
    }
}

struct ItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let description: String
    let creationDate: String
    
    static let defaultItem: ItemModel = .init(
        image: UIImage(named: "defaultImage"),
        title: "Чашечка свежего кофе",
        isFavorite: false,
        description: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n Теперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта",
        creationDate: "12.05.2022"
    )
}
