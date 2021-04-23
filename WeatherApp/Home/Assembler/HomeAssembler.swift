//
//  HomeAssembler.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 23/4/21.
//

import Foundation
import UIKit

class HomeAssembler {
    
    func provide() -> UIViewController {
        
        let client = URLSession.init(configuration: URLSessionConfiguration.default)
        let apiClient = ApiClient(urlSession: client)
        let dataManager = WeatherDataManager(apiClient: apiClient)
        
        
        let interactor = HomeInteractor(weatherDataManager: dataManager, storageClient: StorageClient(), weatherMomentMapper: WeatherMomentMapper())
        let presenter = HomePresenter(interactor: interactor, homeViewModelFactory: HomeViewModelFactory())
        let viewController = HomeViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}
