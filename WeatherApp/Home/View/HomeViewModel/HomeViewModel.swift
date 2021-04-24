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
    let image: String
    let description: String
}

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
                                                    image: mostFrequent?.status.icon ?? "",
                                                    description: mostFrequent?.status.description ?? ""))
        }
        
        return homeViewModelArray.sorted(by: { $0.day < $1.day })
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
