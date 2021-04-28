//
//  File.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation
// TODO: - Mejorar esto
class DetailAssembler {
    
    static func provide(weatherMomentList: [WeatherMoment]) -> Presentable {
        
        let presenter = DetailPresenter(weatherMomentList: weatherMomentList,
                                        selectorViewModelMapper: SelectorViewModelMapper(), infoViewModelMapper: InfoViewModelMapper())
        let vc = DetailViewController(presenter: presenter)
        presenter.view = vc
        return vc
    }
}
