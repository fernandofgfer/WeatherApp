//
//  Weather.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

struct WeatherMoment: Hashable {
    let city: String
    let day: Int
    let hour: Int
    let timestamp: Double
    let conditions: WeatherConditions
    let status: Status
    
    struct WeatherConditions: Hashable {
        let currentTemperature: Double
        let minimumTemparature: Double
        let maximumTemperature: Double
        let feelsLike: Double
        let pressure: Double
        let humidity: Double
    }
    
    struct Status: Equatable, Hashable {
        let description: String
        let icon: String
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(status)
    }
    
    static func == (lhs: WeatherMoment, rhs: WeatherMoment) -> Bool {
        return lhs.status == rhs.status
    }
}
