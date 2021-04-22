//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

struct WeatherDTO: Codable {
    
    let list: [Forecast]
    
    struct Forecast: Codable {
        let dt: Double
        let main: Main
        let weather: [Weather]
    }
    
    struct Main: Codable {
        let temp: Double
        let tempMin: Double
        let tempMax: Double
        let feelsLike: Double
        let pressure: Double
        let humidity: Double
        
        enum CodingKeys: String, CodingKey {
            case temp
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case feelsLike = "feels_like"
            case pressure
            case humidity
        }
    }
    
    struct Weather: Codable{
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
}
