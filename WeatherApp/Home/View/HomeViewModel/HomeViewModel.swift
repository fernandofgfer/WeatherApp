//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 23/4/21.
//

import Foundation

struct HomeViewModel {
    let city: String
    let day: Int
    let timestamp: Double
    let image: String
    let description: String
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMMM"
        let date = Date(timeIntervalSince1970: timestamp)
        return dateFormatter.string(from: date)
    }
}

/// sourcery: AutoMockable
protocol HomeViewModelFactoryProtocol {
    func createViewModel(weatherMomentList: [WeatherMoment]) -> [HomeViewModel]
}

class HomeViewModelFactory: HomeViewModelFactoryProtocol {
    func createViewModel(weatherMomentList: [WeatherMoment]) -> [HomeViewModel] {
        var homeViewModelArray: [HomeViewModel] = []
        let days = getDays(weatherMomentList: weatherMomentList)
        
        days.forEach { day in
            let mostFrequent = getMostFrecuentWeatherMoment(weatherMomentList: weatherMomentList.filter { $0.day == day })
            homeViewModelArray.append(HomeViewModel(city: mostFrequent?.city ?? "",
                                                    day: day,
                                                    timestamp: mostFrequent?.timestamp ?? 0.0,
                                                    image: mostFrequent?.status.icon ?? "",
                                                    description: mostFrequent?.status.description ?? ""))
        }
        
        return homeViewModelArray.sorted(by: { $0.timestamp < $1.timestamp })
    }
    
    fileprivate func getMostFrecuentWeatherMoment(weatherMomentList: [WeatherMoment]) -> WeatherMoment? {
        var repeated: [WeatherMoment: Int] = [:]
        
        weatherMomentList.forEach { weatherMoment in
            repeated[weatherMoment] = (repeated[weatherMoment] ?? 0) + 1
        }
        
        return repeated.sorted(by: {$0.1 > $1.1}).first?.key
    }
    
    fileprivate func getDays(weatherMomentList: [WeatherMoment]) -> [Int] {
        let array = weatherMomentList.map { $0.day }
        return Array(Set(array))
    }
}
