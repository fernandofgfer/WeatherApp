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
    var dataManagerMock: WeatherDataManagerProtocolMock!
    var storageClientMock: StorageClientProtocolMock!
    var mapperMock: WeatherMomentMapperProtocolMock!
    var presenter: HomeInteractorOutputProtocolMock!

    override func setUpWithError() throws {
        dataManagerMock = WeatherDataManagerProtocolMock()
        storageClientMock = StorageClientProtocolMock()
        mapperMock = WeatherMomentMapperProtocolMock()
        presenter = HomeInteractorOutputProtocolMock()
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
        XCTAssertEqual(1, dataManagerMock.fetchLocationCompletionCallsCount)
    }
    
    func testSuccessResponse_shouldSaveDataAndReturnit() {
        // Given
        let dto = WeatherDTO(list: [])
        mapperMock.mapWeatherDTOCityReturnValue = []
        
        // When
        sut.successResponse(dto: dto)
        
        // Then
        XCTAssertEqual(1, storageClientMock.saveCallsCount)
        XCTAssertEqual(1, presenter.weatherDataReturnedWeatherCallsCount)
    }
    
    func testFailureResponse_withoutDataSaved_shouldCallShowError() {
        // When
        sut.failureResponse(error: .noData)
        
        // Then
        XCTAssertEqual(1, presenter.showErrorMessageCallsCount)
    }
}

class StorageClientProtocolMock: StorageClientProtocol {
    var saveCallsCount = 0
    var fetchCallsCount = 0
    
    func save<T>(key: String, data: T) where T: Decodable, T: Encodable {
        saveCallsCount += 1
    }
    
    func fetch<T>(key: String) -> T? where T: Decodable, T: Encodable {
        fetchCallsCount += 1
        return T.self as? T
    }
}
