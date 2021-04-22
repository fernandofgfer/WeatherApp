//
//  HomeInteractor.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

protocol HomeInteractorProtocol {
    func fetchWeatherData()
}

class HomeInteractor {
    
    let weatherDataManager: WeatherDataManagerProtocol
    let storageClient: StorageClientProtocol
    
    init(weatherDataManager: WeatherDataManagerProtocol,
         storageClient: StorageClientProtocol) {
        self.weatherDataManager = weatherDataManager
        self.storageClient = storageClient
    }
    
    func fetchWeatherData() {
        guard let data = fetchStoredData() else {
            weatherDataManager.fetch(location: "LONDON") {[weak self] result in
                self?.manageResult(result: result)
            }
            return
        }
        // Return data
    }
    
    func fetchStoredData() -> WeatherDTO? {
        return storageClient.fetch(key: "file")
    }
    
    func manageResult(result: Result<WeatherDTO, ApiClientError>) {
        switch result {
        case .success(let dto):
            // Return data
            storageClient.save(key: "File", data: dto)
            return
        default:
            return
        }
    }
}
