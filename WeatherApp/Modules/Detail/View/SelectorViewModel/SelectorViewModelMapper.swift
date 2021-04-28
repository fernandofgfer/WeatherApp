//
//  SelectorViewModelMapper.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 28/4/21.
//

import Foundation

/// sourcery: AutoMockable
protocol SelectorViewModelMapperProtocol {
    func map(weatherMomentList: [WeatherMoment]) -> [SelectorViewModel]
}

class SelectorViewModelMapper: SelectorViewModelMapperProtocol {
    func map(weatherMomentList: [WeatherMoment]) -> [SelectorViewModel] {
        return weatherMomentList.map { SelectorViewModel(timestamp: $0.timestamp,
                                                         description: $0.status.description,
                                                         image: $0.status.icon) }
    }
}
