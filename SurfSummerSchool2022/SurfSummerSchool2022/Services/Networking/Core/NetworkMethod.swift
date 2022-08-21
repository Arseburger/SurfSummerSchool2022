//
//  NetworkMethod.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 21.08.2022.
//

import Foundation

enum NetworkMethod: String {
    
    case get
    case post
    
}

extension NetworkMethod {
    
    var method: String {
        rawValue.uppercased()
    }
    
}
