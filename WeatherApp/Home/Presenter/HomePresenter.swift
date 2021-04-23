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
    func weatherDataReturned(weather: [WeatherMoment])
}

class HomePresenter: HomePresenterProtocol {
    
    private let interactor: HomeInteractorProtocol
    private let homeViewModelFactory: HomeViewModelFactoryProtocol
    private var weatherMomentList: [WeatherMoment] = []
    
    init(interactor: HomeInteractorProtocol,
         homeViewModelFactory: HomeViewModelFactoryProtocol) {
        self.interactor = interactor
        self.homeViewModelFactory = homeViewModelFactory
    }
    
    func viewDidLoad() {
        interactor.fetchWeatherData()
    }
    
    func paintViewModel(viewModel: [HomeViewModel]) {
        
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func weatherDataReturned(weather: [WeatherMoment]) {
        weatherMomentList = weather
        paintViewModel(viewModel: homeViewModelFactory.createViewModel(weatherMomentList: weatherMomentList))
    }
}
