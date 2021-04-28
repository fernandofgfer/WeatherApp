//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation

/// sourcery: AutoMockable
protocol HomeRouterProtocol {
    func pushToDetailedView(weatherMomentList: [WeatherMoment])
}

class HomeRouter: HomeRouterProtocol {
    
    weak var view: NavigableView?
    
    func pushToDetailedView(weatherMomentList: [WeatherMoment]) {
        let vc = DetailAssembler().provideDetail(weatherMomentList: weatherMomentList)
        view?.pushView(vc, animated: true)
    }
}
