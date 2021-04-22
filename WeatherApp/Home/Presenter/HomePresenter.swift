//
//  HomePresenter.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func weatherDataReturned(weather: WeatherDTO)
}

class HomePresenter: HomePresenterProtocol {
    
    private let interactor: HomeInteractorProtocol
    
    init(interactor: HomeInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        interactor.fetchWeatherData()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func weatherDataReturned(weather: WeatherDTO) {
        // Guardarlo y mapearlo
    }
}
