//
//  ApiClientProtocol.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 28/4/21.
//

import Foundation

typealias Callback<T> = (Result<T, ApiClientError>) -> Void

protocol ApiClientProtocol {
    func fetch<T: Decodable>(resource: Resource, completion: @escaping Callback<T>)
}

struct Resource {
    let path: String
    let method: HTTPMethod
    let parameters: [String: String]
}

public enum ApiClientError: Error {
    case unknown
    case noInternet
    case noData
    case decodeFailed
    case urlWrong
    
    var message: String {
        switch self {
        case .unknown:
            return NSLocalizedString("Error.unknown", comment: "")
        case .decodeFailed:
            return NSLocalizedString("Error.decode", comment: "")
        case .noData:
            return NSLocalizedString("Error.data", comment: "")
        case .urlWrong:
            return NSLocalizedString("Error.url", comment: "")
        case .noInternet:
            return NSLocalizedString("Error.network", comment: "")
        }
    }
}

public enum HTTPMethod: String {
    case get = "GET"
}

