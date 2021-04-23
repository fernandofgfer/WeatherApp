//
//  Weather.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

struct WeatherMoment {
    let day: Int
    let hour: Int
    let conditions: WeatherConditions
    let status: Status
    
    struct WeatherConditions {
        let currentTemperature: Double
        let minimumTemparature: Double
        let maximumTemperature: Double
        let feelsLike: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct Status: Equatable {
        let description: String
        let icon: String
    }
}
