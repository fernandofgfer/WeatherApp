//
//  ApiConfiguration.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 28/4/21.
//

import Foundation

protocol ApiConfigurationProtocol {
    func getUrl() -> String?
    func getApiKey() -> String?
}

class ApiConfiguration: ApiConfigurationProtocol {
    
    static let fileName = "ApiProperties"
    
    private var url: String?
    private var apiKey: String?
    
    init() {
        loadFromPlist()
    }
    
    func loadFromPlist() {
        guard let fileName = Bundle.main.path(forResource: ApiConfiguration.fileName, ofType: "plist"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: fileName)),
              let file = try? PropertyListSerialization.propertyList(from: data,
                                                                     options: .mutableContainers,
                                                                     format: nil) as? [String: String] else {
            return
        }
        
        url = file["Url"]
        apiKey = file["ApiKey"]
    }
    
    func getUrl() -> String? {
        return url
    }
    
    func getApiKey() -> String? {
        return apiKey
    }
}
