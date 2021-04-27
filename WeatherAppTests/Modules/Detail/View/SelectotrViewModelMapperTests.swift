//
//  SelectotrViewModelMapperTests.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 27/4/21.
//

import XCTest
@testable import WeatherApp

class SelectorViewModelMapperTests: XCTestCase {

    var sut: SelectorViewModelMapper!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = SelectorViewModelMapper()
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testMap_shouldReturnProperlyViewModel() {
        // Given
        let weatherMoment = WeatherAppUtils.weatherMoment
        
        // When
        let result = sut.map(weatherMomentList: [weatherMoment])
        
        // Then
        XCTAssertEqual(weatherMoment.timestamp, result[0].timestamp)
        XCTAssertEqual(weatherMoment.status.description, result[0].description)
        XCTAssertEqual(weatherMoment.status.icon, result[0].image)
    }
}
