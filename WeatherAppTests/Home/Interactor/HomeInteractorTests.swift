//
//  HomeInteractorTests.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import XCTest
@testable import WeatherApp

class HomeInteractorTests: XCTestCase {
    
    var sut: HomeInteractor!
    var dataManagerMock: WeatherDataManagerMock!
    var storageClientMock: StorageClientMock!
    var mapperMock: WeatherMomentDataMapperMock!
    var presenter: HomeInteractorOutputMock!

    override func setUpWithError() throws {
        dataManagerMock = WeatherDataManagerMock()
        storageClientMock = StorageClientMock()
        mapperMock = WeatherMomentDataMapperMock()
        presenter = HomeInteractorOutputMock()
        sut =  HomeInteractor(weatherDataManager: dataManagerMock,
                              storageClient: storageClientMock,
                              weatherMomentMapper: mapperMock)
        sut.presenter = presenter
       
        super.setUp()
    }

    override func tearDownWithError() throws {
        presenter = nil
        mapperMock = nil
        storageClientMock = nil
        dataManagerMock = nil
        sut = nil
        super.tearDown()
    }
    
    func testFetchWeatherData_shouldCallFetch() {
        // When
        sut.fetchWeatherData()
        
        // Then
        XCTAssertEqual(1, dataManagerMock.fetchCalledCount)
    }
    
    func testSuccessResponse_shouldSaveDataAndReturnit() {
        // Given
        let dto = WeatherDTO(list: [])
        
        // When
        sut.successResponse(dto: dto)
        
        // Then
        XCTAssertEqual(1, storageClientMock.saveCalledCount)
        XCTAssertEqual(1, presenter.weatherDataReturnedCalledCount)
    }
    
    func testFailureResponse_withoutDataSaved_shouldCallShowError() {
        // When
        sut.failureResponse(error: .noData)
        
        // Then
        XCTAssertEqual(1, presenter.showErrorCalledCount)
    }
    
}


class WeatherDataManagerMock: WeatherDataManagerProtocol {
    
    var fetchCalled = false
    var fetchCalledCount = 0
    
    func fetch(location: String, completion: @escaping (Result<WeatherDTO, ApiClientError>) -> Void) {
        fetchCalled = true
        fetchCalledCount += 1
    }
}

class StorageClientMock: StorageClientProtocol {
    
    var saveCalled = false
    var saveCalledCount = 0
    var fetchCalled = false
    var fetchCalledCount = 0
    
    func save<T>(key: String, data: T) where T : Decodable, T : Encodable {
        saveCalled = true
        saveCalledCount += 1
    }
    
    func fetch<T>(key: String) -> T? where T : Decodable, T : Encodable {
        fetchCalled = true
        fetchCalledCount += 1
        return T.self as? T
    }
}

class WeatherMomentDataMapperMock: WeatherMomentMapperProtocol {
    
    var mapCalled = false
    var mapCalledCount = 0
    
    func map(weatherDTO: WeatherDTO, city: String) -> [WeatherMoment] {
        mapCalled = true
        mapCalledCount += 1
        return []
    }
}

class HomeInteractorOutputMock: HomeInteractorOutputProtocol {
    
    var weatherDataReturnedCalled = false
    var weatherDataReturnedCalledCount = 0
    var showErrorCalled = false
    var showErrorCalledCount = 0
    
    func weatherDataReturned(weather: [WeatherMoment]) {
        weatherDataReturnedCalled = true
        weatherDataReturnedCalledCount += 1
    }
    
    func showError(message: String) {
        showErrorCalled = true
        showErrorCalledCount += 1
    }
    
    
}
