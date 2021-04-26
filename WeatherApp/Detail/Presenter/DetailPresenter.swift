//
//  DetailPresenter.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation

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
    
    private var selectorViewModelList: [SelectorViewModel] = []
    
    init(weatherMomentList: [WeatherMoment],
         selectorViewModelMapper: SelectorViewModelMapperProtocol) {
        self.weatherMomentList = weatherMomentList
        self.selectorViewModelMapper = selectorViewModelMapper
    }
    
    func viewDidLoad() {
        mapForSelector()
        view?.reloadTable(numberOfCells: selectorViewModelList.count)
    }
    
    func configureCell(index: Int, cell: SelectorCellProtocol?) {
        cell?.loadData(viewModel: selectorViewModelList[index])
    }
    
    func cellPressed(index: Int) {
        
    }
    
    private func mapForSelector() {
        selectorViewModelList = selectorViewModelMapper.map(weatherMomentList: weatherMomentList)
    }
}
