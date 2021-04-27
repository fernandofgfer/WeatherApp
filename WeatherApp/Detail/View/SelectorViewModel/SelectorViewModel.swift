//
//  SelectorViewModel.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation

struct SelectorViewModel {
    let timestamp: Double
    let description: String
    let image: String
    
    func getFormattedHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = Date(timeIntervalSince1970: timestamp)
        return dateFormatter.string(from: date)
    }
}

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
