//
//  Date+Utils.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 24/4/21.
//

import Foundation

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
}
