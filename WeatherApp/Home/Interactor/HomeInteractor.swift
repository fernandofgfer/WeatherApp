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

class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    
    // MARK: - Private variables
    
    private let weatherDataManager: WeatherDataManagerProtocol
    private let storageClient: StorageClientProtocol
    private let weatherMomentMapper: WeatherMomentMapperProtocol
    
    // MARK: - Custom init
    
    init(weatherDataManager: WeatherDataManagerProtocol,
         storageClient: StorageClientProtocol,
         weatherMomentMapper: WeatherMomentMapperProtocol) {
        self.weatherDataManager = weatherDataManager
        self.storageClient = storageClient
        self.weatherMomentMapper = weatherMomentMapper
    }
    
    // MARK: - HomeInteractorProtocol
    
    func fetchWeatherData() {
        guard let data = fetchStoredData() else {
            weatherDataManager.fetch(location: "LONDON") {[weak self] result in
                self?.manageResult(result: result)
            }
            return
        }
        presenter?.weatherDataReturned(weather: weatherMomentMapper.map(weatherDTO: data))
    }
    
    // MARK: - Business logic
    
    func fetchStoredData() -> WeatherDTO? {
        return storageClient.fetch(key: "file")
    }
    
    func manageResult(result: Result<WeatherDTO, ApiClientError>) {
        switch result {
        case .success(let dto):
            presenter?.weatherDataReturned(weather: weatherMomentMapper.map(weatherDTO: dto))
            storageClient.save(key: "File", data: dto)
            return
        default:
            return
        }
    }
}
