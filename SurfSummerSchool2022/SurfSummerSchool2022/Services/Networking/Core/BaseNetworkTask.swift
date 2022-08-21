//
//  BaseNetworkTask.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 21.08.2022.
//

import Foundation

struct BaseNetworkTask<AbstractInput: Encodable, AbstractOutput: Decodable>: NetworkTask {
    
    // MARK: NetworkTask -
    
    typealias Input = AbstractInput
    typealias Output = AbstractOutput
    
    var baseURL: URL? {
        URL(string: "https://pictures.chronicker.fun/api/")
    }
    
    let path: String
    let method: NetworkMethod
    let session: URLSession = URLSession(configuration: .default)
    let needsTokenInjected: Bool
    
    var tokenStorage: TokenStorage {
        BaseTokenStorage()
    }
    
    // MARK: Initialization -
    
    init(needsTokenInjected: Bool, method: NetworkMethod, path: String) {
        self.needsTokenInjected = needsTokenInjected
        self.method = method
        self.path = path
    }
    
    // MARK: NetworkTask -
    
    func performRequest(
        input: AbstractInput,
        _ onReceivedResponse: @escaping (Result<AbstractOutput, Error>) -> Void
    ) {
        do {
            
        }
    }
}

// MARK: Private Methods -

private extension BaseNetworkTask {
    
    enum NetworkTaskError: Error {
        case unknownError
        case urlWasNotFound
        case urlComponentWasNotCreated
        case parametersIsInvalidJsonObject
    }
    
    func getRequest(with parameters: AbstractInput) throws -> URLRequest {
        
        guard let url = completedURL else {
            throw NetworkTaskError.urlWasNotFound
        }
        
        var request: URLRequest
        switch method {
            case .get:
                let newUrl = try getUrlWithQueryParameters(for: url, parameters: parameters)
                request = URLRequest(url: newUrl)
            case .post:
                request = URLRequest(url: url)
                request.httpBody = try getParametersForBody(from: parameters)
        }
        request.httpMethod = method.method
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if needsTokenInjected {
            request.addValue("Token \(try tokenStorage.getToken())", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
    func getParametersForBody(from encodableParameters: AbstractInput) throws -> Data {
        return try JSONEncoder().encode(encodableParameters)
    }
    
    func getUrlWithQueryParameters(for url: URL, parameters: AbstractInput) throws -> URL {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkTaskError.urlComponentWasNotCreated
            
        }
        
        let parametersInDataRepresentation = try JSONEncoder().encode(parameters)
        let parametersInDictionaryRepresentation = try JSONSerialization.jsonObject(with: parametersInDataRepresentation)
        
        guard let parametersInDictionaryRepresentation = parametersInDictionaryRepresentation as? [String: Any] else {
            throw NetworkTaskError.parametersIsInvalidJsonObject
        }
        
        let queryItems = parametersInDictionaryRepresentation.map { key, value in
            return URLQueryItem(name: key, value: "\(value)")
        }
        
        if !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
        }
        
        guard let newUrlWithQuery = urlComponents.url else {
            throw NetworkTaskError.urlWasNotFound
        }
        
        return newUrlWithQuery
        
    }
    
    
    
    
}
