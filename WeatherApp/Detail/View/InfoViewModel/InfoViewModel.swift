//
//  InfoViewModel.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 27/4/21.
//

import Foundation

struct InfoViewModel {
    let currentTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let feelsLikeTemperature: String
    let pression: String
    let humidity: String
}

protocol InfoViewModelMapperProtocol {
    func map(weatherMoment: WeatherMoment) -> InfoViewModel
}

class InfoViewModelMapper: InfoViewModelMapperProtocol {
    func map(weatherMoment: WeatherMoment) -> InfoViewModel {
        return InfoViewModel(currentTemperature: getDataWithCelsius(data: weatherMoment.conditions.currentTemperature),
                             minTemperature: getDataWithCelsius(data: weatherMoment.conditions.minimumTemparature),
                             maxTemperature: getDataWithCelsius(data: weatherMoment.conditions.maximumTemperature),
                             feelsLikeTemperature: getDataWithCelsius(data: weatherMoment.conditions.feelsLike),
                             pression: getPression(data: weatherMoment.conditions.pressure),
                             humidity: getHumidityWithPercentage(data: weatherMoment.conditions.humidity))
    }
    
    private func getDataWithCelsius(data: Double) -> String {
        return "\(data) ºC"
    }
    
    private func getHumidityWithPercentage(data: Double) -> String {
        return "\(data) %"
    }
    
    private func getPression(data: Double) -> String {
        return "\(data) hPa"
    }
}
