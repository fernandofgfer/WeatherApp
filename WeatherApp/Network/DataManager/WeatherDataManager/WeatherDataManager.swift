//
//  WeatherDataManager.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

/// sourcery: AutoMockable
protocol WeatherDataManagerProtocol {
    func fetch(location: String, completion: @escaping (Result<WeatherDTO, ApiClientError>) -> Void)
}

class WeatherDataManager: WeatherDataManagerProtocol {
    
    private let apiClient: ApiClientProtocol
    private let apiConfiguration: ApiConfigurationProtocol
    
    init(apiClient: ApiClientProtocol,
         apìConfiguration: ApiConfigurationProtocol) {
        self.apiClient = apiClient
        self.apiConfiguration = apìConfiguration
    }
    
    func fetch(location: String, completion: @escaping (Result<WeatherDTO, ApiClientError>) -> Void) {
        
        guard let url = apiConfiguration.getUrl(),
              let apiKey = apiConfiguration.getApiKey() else {
            completion(.failure(.unknown))
            return
        }
        
        let resource = Resource(path: "\(url)forecast", method: .get, parameters: ["q": location, "units": "metric", "appid": apiKey])
        apiClient.fetch(resource: resource, completion: completion)
    }
}
