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
    // This is only for the challengue
    private static let city = "PARIS"
    private static let fileName = "FileStorage"
    
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
        weatherDataManager.fetch(location: HomeInteractor.city) {[weak self] result in
            self?.manageResult(result: result)
        }
    }
    
    // MARK: - Business logic
    
    func fetchStoredData() -> WeatherDTO? {
        return storageClient.fetch(key: HomeInteractor.fileName)
    }
    
    func manageResult(result: Result<WeatherDTO, ApiClientError>) {
        switch result {
        case .success(let dto):
            successResponse(dto: dto)
            return
        case .failure(let error):
            failureResponse(error: error)
        }
    }
    
    func successResponse(dto: WeatherDTO) {
        returnWeatherMoment(dto: dto)
        storageClient.save(key: HomeInteractor.fileName, data: dto)
    }
    
    func failureResponse(error: ApiClientError) {
        guard let dto = fetchStoredData() else {
            presenter?.showError(message: error.message)
            return
        }
        returnWeatherMoment(dto: dto)
    }
    
    
    func returnWeatherMoment(dto: WeatherDTO) {
        presenter?.weatherDataReturned(weather: weatherMomentMapper.map(weatherDTO: dto, city: HomeInteractor.city))
    }
}
