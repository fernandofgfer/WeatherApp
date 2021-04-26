//
//  SelectorViewModel.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation

struct SelectorViewModel {
    let day: Int
    let hour: Int
    let image: String
}

protocol SelectorViewModelMapperProtocol {
    func map(weatherMomentList: [WeatherMoment]) -> [SelectorViewModel]
}

class SelectorViewModelMapper: SelectorViewModelMapperProtocol {
    func map(weatherMomentList: [WeatherMoment]) -> [SelectorViewModel] {
        return weatherMomentList.map { SelectorViewModel(day: $0.day, hour: $0.hour, image: $0.status.icon) }
    }
}
