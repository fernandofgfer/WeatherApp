//
//  HomeAssembler.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 23/4/21.
//

import Foundation
import UIKit

protocol HomeAssemblerProtocol {
    func provideHome() -> UIViewController
}

class HomeAssembler: HomeAssemblerProtocol {

    func provideHome() -> UIViewController {
        let dataManager = WeatherDataManager(apiClient: resolveApìClient(),
                                             apìConfiguration: resolveApiConfiguration())
        let router = HomeRouter()
        let interactor = HomeInteractor(weatherDataManager: dataManager,
                                        storageClient: resolveStorageClient(),
                                        weatherMomentMapper: resolveWeatherMomentMapper())
        let presenter = HomePresenter(interactor: interactor,
                                      homeViewModelFactory: resolveHomeViewModelMapper(),
                                      router: router)
        let viewController = HomeViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        router.view = viewController
        return viewController
    }
    
    private func resolveApìClient() -> ApiClientProtocol {
        let client = URLSession.init(configuration: URLSessionConfiguration.default)
        let apiClient = ApiClient(urlSession: client)
        return apiClient
    }
    
    private func resolveApiConfiguration() -> ApiConfigurationProtocol {
        return ApiConfiguration()
    }
    
    private func resolveStorageClient() -> StorageClientProtocol {
        return StorageClient()
    }
    
    private func resolveWeatherMomentMapper() -> WeatherMomentMapperProtocol {
        return WeatherMomentMapper()
    }
    
    private func resolveHomeViewModelMapper() -> HomeViewModelMapperProtocol {
        return HomeViewModelMapper()
    }
}
