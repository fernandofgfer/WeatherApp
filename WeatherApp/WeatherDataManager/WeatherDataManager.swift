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
    
    let apiClient: ApiClientProtocol
    
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetch(location: String, completion: @escaping (Result<WeatherDTO, ApiClientError>) -> Void) {
        // TODO:- Add this to a plist file
        let resource = Resource(path: "http://api.openweathermap.org/data/2.5/forecast", method: .get, parameters: ["q": location, "units": "metric", "appid": "b2b93d02ac69637ee86f1275917ffc28"])
        apiClient.fetch(resource: resource, completion: completion)
    }
}
