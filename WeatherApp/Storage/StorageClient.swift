//
//  StorageClient.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 22/4/21.
//

import Foundation

protocol StorageClientProtocol {
    func save<T: Codable>(key: String, data: T)
    func fetch<T: Codable>(key: String) -> T?
}

class StorageClient: StorageClientProtocol {
    func save<T>(key: String, data: T) where T: Decodable, T: Encodable {
        let filePath = getDocumentsDirectory().appendingPathComponent(key)
        do {
            let dataEncoded = try JSONSerialization.jsonObject(with: JSONEncoder().encode(data)) as? [String: Any] ?? [:]

            let fileData = try NSKeyedArchiver.archivedData(withRootObject: dataEncoded, requiringSecureCoding: false)
            try fileData.write(to: filePath)
        } catch {
            print("Error in file writting")
        }
    }
    
    func fetch<T>(key: String) -> T? where T: Decodable, T: Encodable {
        let filePath = getDocumentsDirectory().appendingPathComponent(key)
        do {
            let dataFile = try Data(contentsOf: filePath)
            guard let dataEncoded = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataFile) else { return nil }
            
            let data = try JSONSerialization.data(withJSONObject: dataEncoded, options: [])
            
            return try JSONDecoder().decode(T.self, from: data)
            
        } catch {
            print("Error in file reading")
            return nil
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
