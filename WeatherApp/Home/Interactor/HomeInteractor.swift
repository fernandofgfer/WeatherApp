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
    
    private let weatherDataManager: WeatherDataManagerProtocol
    private let storageClient: StorageClientProtocol
    
    weak var presenter: HomeInteractorOutputProtocol?
    
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
        presenter?.weatherDataReturned(weather: data)
    }
    
    func fetchStoredData() -> WeatherDTO? {
        return storageClient.fetch(key: "file")
    }
    
    func manageResult(result: Result<WeatherDTO, ApiClientError>) {
        switch result {
        case .success(let dto):
            presenter?.weatherDataReturned(weather: dto)
            storageClient.save(key: "File", data: dto)
            return
        default:
            return
        }
    }
}
