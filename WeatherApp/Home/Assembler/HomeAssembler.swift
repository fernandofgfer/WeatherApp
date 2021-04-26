//
//  HomeAssembler.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 23/4/21.
//

import Foundation
import UIKit

class HomeAssembler {

    func provide(view: NavigableView?) -> UIViewController {
        
        let client = URLSession.init(configuration: URLSessionConfiguration.default)
        let apiClient = ApiClient(urlSession: client)
        let dataManager = WeatherDataManager(apiClient: apiClient)
        
        let router = HomeRouter(view: view)
        let interactor = HomeInteractor(weatherDataManager: dataManager, storageClient: StorageClient(), weatherMomentMapper: WeatherMomentMapper())
        let presenter = HomePresenter(interactor: interactor, homeViewModelFactory: HomeViewModelFactory(), router: router)
        let viewController = HomeViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        return viewController
    }
}
