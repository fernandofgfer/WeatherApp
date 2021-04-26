//
//  HomeRouter.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation

protocol HomeRouterProtocol {
    func pushToDetailedView(weatherMomentList: [WeatherMoment])
}

class HomeRouter: HomeRouterProtocol {
    
    weak var view: NavigableView?
    
    init(view: NavigableView?) {
        self.view = view
    }
    
    func pushToDetailedView(weatherMomentList: [WeatherMoment]) {
        //view?.pushView(<#T##view: Presentable##Presentable#>, animated: <#T##Bool#>)
    }
}
