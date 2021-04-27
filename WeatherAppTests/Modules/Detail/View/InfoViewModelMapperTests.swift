//
//  InfoViewModelMapperTests.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 27/4/21.
//

import XCTest
@testable import WeatherApp

class InfoViewModelMapperTests: XCTestCase {

    var sut: InfoViewModelMapper!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = InfoViewModelMapper()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testMap_shouldReturnProperlyFormattedData() {
        // Given
        let weatherMoment = WeatherAppUtils.weatherMoment
        
        // When
        let result = sut.map(weatherMoment: weatherMoment)
        
        // Then
        XCTAssertEqual("1.0 ºC", result.currentTemperature)
        XCTAssertEqual("1.0 %", result.humidity)
        XCTAssertEqual("1.0 hPa", result.pression)
    }
}
