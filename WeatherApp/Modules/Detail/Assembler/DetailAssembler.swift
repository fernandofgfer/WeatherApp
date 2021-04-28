//
//  File.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation

protocol DetailAssemblerProtocol {
    func provideDetail(weatherMomentList: [WeatherMoment]) -> Presentable
}

class DetailAssembler: DetailAssemblerProtocol {
    
    func provideDetail(weatherMomentList: [WeatherMoment]) -> Presentable {
        let presenter = DetailPresenter(weatherMomentList: weatherMomentList,
                                        selectorViewModelMapper: resolveSelectorViewModelMapper(),
                                        infoViewModelMapper: resolveInfoViewModelMapper())
        let vc = DetailViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
    
    private func resolveSelectorViewModelMapper() -> SelectorViewModelMapperProtocol {
        return SelectorViewModelMapper()
    }
    
    private func resolveInfoViewModelMapper() -> InfoViewModelMapperProtocol {
        return InfoViewModelMapper()
    }
}
