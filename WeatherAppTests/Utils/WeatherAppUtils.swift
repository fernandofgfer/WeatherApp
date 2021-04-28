//
//  Utils.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation
@testable import WeatherApp

class WeatherAppUtils {
    static let list = [WeatherDTO.Forecast(dt: 1619449200, main: WeatherDTO.Main(temp: 1,
                                                                             tempMin: 1,
                                                                             tempMax: 1,
                                                                             feelsLike: 1,
                                                                             pressure: 1,
                                                                             humidity: 1),
                                          weather: [WeatherDTO.Weather(id: 1,
                                                                       main: "",
                                                                       description: "",
                                                                       icon: "")]),
                       WeatherDTO.Forecast(dt: 1619470800, main: WeatherDTO.Main(temp: 1,
                                                                               tempMin: 1,
                                                                               tempMax: 1,
                                                                               feelsLike: 1,
                                                                               pressure: 1,
                                                                               humidity: 1),
                                            weather: [WeatherDTO.Weather(id: 1,
                                                                         main: "",
                                                                         description: "",
                                                                         icon: "")])]
    static let dto = WeatherDTO(list: list)
    
    static let weatherMoment = WeatherMoment(city: "PARIS",
                                             day: 2,
                                             hour: 2,
                                             timestamp: 1619449200,
                                             conditions: WeatherMoment.WeatherConditions(currentTemperature: 1,
                                                                                         minimumTemparature: 1,
                                                                                         maximumTemperature: 1,
                                                                                         feelsLike: 1,
                                                                                         pressure: 1,
                                                                                         humidity: 1),
                                             status: WeatherMoment.Status(description: "cloudy",
                                                                          icon: "x"))
    
    static let homeViewModel = HomeViewModel(city: "PARIS",
                                             day: 2,
                                             timestamp: 1619449200,
                                             image: "x",
                                             description: "cloudy")
    
    static let selectorViewModel = SelectorViewModel(timestamp: 1619449200,
                                                     description: "cloudy",
                                                     image: "x")
    
    static let infoViewModel = InfoViewModel(currentTemperature: "1",
                                             minTemperature: "1",
                                             maxTemperature: "1",
                                             feelsLikeTemperature: "1",
                                             pression: "1",
                                             humidity: "1")
}
