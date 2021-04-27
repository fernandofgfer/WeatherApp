//
//  WeatherMomentMapperTests.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import XCTest
@testable import WeatherApp

class WeatherMomentMapperTests: XCTestCase {

    var sut: WeatherMomentMapper!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = WeatherMomentMapper()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testMap_shouldReturnProperlyData() {
        // Given
        let dto = WeatherAppUtils.dto
        
        // When
        let result = sut.map(weatherDTO: dto, city: "PARIS")
        
        // Then
        XCTAssertEqual(26, result[0].day)
        XCTAssertEqual("PARIS", result[0].city)
    }
}




