//
//  HomePresenter.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    func viewDidLoad()
    func configureCell(index: Int, cell: HomeCellProtocol?)
    func cellPressed(index: Int)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func weatherDataReturned(weather: [WeatherMoment])
    func showError(message: String)
}

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeViewProtocol?
    
    // MARK: - Private
    private let interactor: HomeInteractorProtocol
    private let homeViewModelFactory: HomeViewModelFactoryProtocol
    private var weatherMomentList: [WeatherMoment] = []
    private var homeViewModelList: [HomeViewModel] = []
    private var router: HomeRouterProtocol
    
    // MARK: - Custom init
    
    init(interactor: HomeInteractorProtocol,
         homeViewModelFactory: HomeViewModelFactoryProtocol,
         router: HomeRouterProtocol) {
        self.interactor = interactor
        self.homeViewModelFactory = homeViewModelFactory
        self.router = router
    }
    
    // MARK: - HomePresenterProtocol
    
    func viewDidLoad() {
        interactor.fetchWeatherData()
    }
    
    func configureCell(index: Int, cell: HomeCellProtocol?) {
        cell?.loadData(viewModel: homeViewModelList[index])
    }
    
    func cellPressed(index: Int) {
        let weatherMomentForADay =  weatherMomentList.filter { $0.day == homeViewModelList[index].day }
        router.pushToDetailedView(weatherMomentList: weatherMomentForADay)
    }
    
    // MARK: - Private methods
    
    private func paintViewModel() {
        view?.reloadTable(numberOfCells: homeViewModelList.count)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    // MARK: - HomeInteractorOutputProtocol
    
    func weatherDataReturned(weather: [WeatherMoment]) {
        weatherMomentList = weather
        homeViewModelList = homeViewModelFactory.createViewModel(weatherMomentList: weatherMomentList)
        paintViewModel()
    }
    
    func showError(message: String) {
        view?.showError(message: message)
    }
}
