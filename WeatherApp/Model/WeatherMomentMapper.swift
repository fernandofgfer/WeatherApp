//
//  WeatherMomentMapper.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

/// sourcery: AutoMockable
protocol WeatherMomentMapperProtocol {
    func map(weatherDTO: WeatherDTO, city: String) -> [WeatherMoment]
}

class WeatherMomentMapper: WeatherMomentMapperProtocol {
    
    func map(weatherDTO: WeatherDTO, city: String) -> [WeatherMoment] {
        return weatherDTO.list.map { weather in
            let dates = getDay(from: weather.dt)
            return WeatherMoment(city: city,
                                 day: dates.day ?? 0,
                                 hour: dates.hour ?? 0,
                                 timestamp: weather.dt,
                                 conditions: getWeatherConditions(main: weather.main),
                                 status: getWeatherStatus(weather: weather.weather.first))
        }
    }
    
    
    private func getDay(from timestamp: Double) -> DateComponents {
        let date = Date(timeIntervalSince1970: timestamp)
        return Calendar.current.dateComponents([.day, .hour], from: date)
        
    }
    
    private func getWeatherConditions(main: WeatherDTO.Main) -> WeatherMoment.WeatherConditions {
        return WeatherMoment.WeatherConditions(currentTemperature: main.temp,
                                               minimumTemparature: main.tempMin,
                                               maximumTemperature: main.tempMax,
                                               feelsLike: main.feelsLike,
                                               pressure: main.pressure,
                                               humidity: main.humidity)
    }
    
    private func getWeatherStatus(weather: WeatherDTO.Weather?) -> WeatherMoment.Status {
        return WeatherMoment.Status(description: weather?.description ?? "",
                                    icon: getUrlIcon(icon: weather?.icon))
    }
    
    private func getUrlIcon(icon: String?) -> String {
        guard let icon = icon else {
            return ""
        }
        return "http://openweathermap.org/img/wn/\(icon)@2x.png"
    }
}
