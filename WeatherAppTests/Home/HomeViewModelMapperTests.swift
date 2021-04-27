//
//  HomeViewModelMapperTests.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 27/4/21.
//

import Foundation


import XCTest
@testable import WeatherApp

class HomeViewModelMapperTests: XCTestCase {
 
    var sut: HomeViewModelFactory!
    
    override func setUpWithError() throws {
        super.setUp()
        sut = HomeViewModelFactory()
    }
 
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testCreateViewModel_withAnArray_shouldReturnProperlyViewModel() {
        // Given
        let weatherMoment = WeatherAppUtils.weatherMoment
        
        // When
        let result = sut.createViewModel(weatherMomentList: [weatherMoment])
        
        // Then
        XCTAssertEqual(weatherMoment.day, result[0].day)
        XCTAssertEqual(weatherMoment.timestamp, result[0].timestamp)
        XCTAssertEqual(weatherMoment.status.description, result[0].description)
    }
}
