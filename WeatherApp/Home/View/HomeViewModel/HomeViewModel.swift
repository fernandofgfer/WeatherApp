//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 23/4/21.
//

import Foundation

struct HomeViewModel {
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
            let mostFrequent = getMostFrecuentStatus(status: weatherMomentList.filter { $0.day == day }.map { $0.status })
            homeViewModelArray.append(HomeViewModel(day: day, image: mostFrequent?.icon ?? "", description: mostFrequent?.description ?? ""))
        }
        
        return homeViewModelArray.sorted(by: { $0.day < $1.day })
    }
    
    fileprivate func getMostFrecuentStatus(status: [WeatherMoment.Status]) -> WeatherMoment.Status? {
        let countedSet = NSCountedSet(array: status)
        return countedSet.max { countedSet.count(for: $0) < countedSet.count(for: $1) } as? WeatherMoment.Status
    }
    
    fileprivate func getDays(weatherMomentList: [WeatherMoment]) -> [Int] {
        let array = weatherMomentList.map { $0.day }
        return Array(Set(array))
    }
}
