//
//  DetailPresenter.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation

/// sourcery: AutoMockable
protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    func viewDidLoad()
    func configureCell(index: Int, cell: SelectorCellProtocol?)
    func cellPressed(index: Int)
}

class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    
    private var weatherMomentList: [WeatherMoment]
    private var selectorViewModelMapper: SelectorViewModelMapperProtocol
    private var infoViewModelMapper: InfoViewModelMapperProtocol
    
    private var selectorViewModelList: [SelectorViewModel] = []
    
    init(weatherMomentList: [WeatherMoment],
         selectorViewModelMapper: SelectorViewModelMapperProtocol,
         infoViewModelMapper: InfoViewModelMapperProtocol) {
        self.weatherMomentList = weatherMomentList
        self.selectorViewModelMapper = selectorViewModelMapper
        self.infoViewModelMapper = infoViewModelMapper
    }
    
    func viewDidLoad() {
        mapForSelector()
        view?.setTitle(title: weatherMomentList.first?.city)
        view?.reloadTable(numberOfCells: selectorViewModelList.count)
        view?.setInfoView(infoViewModel: infoViewModelMapper.map(weatherMoment: weatherMomentList[0]))
    }
    
    func configureCell(index: Int, cell: SelectorCellProtocol?) {
        cell?.loadData(viewModel: selectorViewModelList[index])
    }
    
    func cellPressed(index: Int) {
        view?.setInfoView(infoViewModel: infoViewModelMapper.map(weatherMoment: weatherMomentList[index]))
    }
    
    private func mapForSelector() {
        selectorViewModelList = selectorViewModelMapper.map(weatherMomentList: weatherMomentList)
    }
}
