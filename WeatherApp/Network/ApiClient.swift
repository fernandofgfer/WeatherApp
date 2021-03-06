//
//  ApiClientProtocol.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

class ApiClient: ApiClientProtocol {
    
    var urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    private func makeRequest(resource: Resource) -> URLRequest? {
        guard let url = URL(string: resource.path) else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = resource.method.rawValue
        if !resource.parameters.isEmpty {
            if var urlComponents = URLComponents(string: resource.path) {
                urlComponents.queryItems = resource.parameters.map { URLQueryItem(name: $0, value: $1) }
                urlRequest.url = urlComponents.url
            }
        }
        return urlRequest
    }
    
    func fetch<T>(resource: Resource, completion: @escaping Callback<T>) where T: Decodable {
        guard let request = makeRequest(resource: resource) else {
            completion(.failure(.urlWrong))
            return
        }
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.noInternet))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            guard let response = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(.decodeFailed))
                return
            }
            
            completion(.success(response))
        }
        task.resume()
    }
}
