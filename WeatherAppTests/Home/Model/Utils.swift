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
}
