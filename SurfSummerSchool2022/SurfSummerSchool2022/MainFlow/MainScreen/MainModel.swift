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
    
    var items: [DetailItemModel] = [] {
        didSet {
            didUpdateItems?()
        }
    }
    
    // MARK: Methods -
    
    func getPosts() {
        items = Array(repeating: .defaultItem, count: 50)
    }
}

