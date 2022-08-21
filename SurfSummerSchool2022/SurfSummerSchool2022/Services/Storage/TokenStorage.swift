//
//  TokenStorage.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 21.08.2022.
//

import Foundation

protocol TokenStorage {
    
    func getToken() throws -> TokenContainer
    func set(newToken: TokenContainer) throws

}
