//
//  DetailPresenterTests.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 27/4/21.
//

import XCTest
@testable import WeatherApp

class DetailPresenterTests: XCTestCase {

    var sut: DetailPresenter!
    var selectorViewModelMapperMock: SelectorViewModelMapperProtocolMock!
    var infoViewModelMapperMock: InfoViewModelMapperProtocolMock!
    var viewMock: DetailViewProtocolMock!
    
    override func setUpWithError() throws {
        super.setUp()
        viewMock = DetailViewProtocolMock()
        selectorViewModelMapperMock = SelectorViewModelMapperProtocolMock()
        infoViewModelMapperMock = InfoViewModelMapperProtocolMock()
        sut = DetailPresenter(weatherMomentList: [WeatherAppUtils.weatherMoment],
                              selectorViewModelMapper: selectorViewModelMapperMock,
                              infoViewModelMapper: infoViewModelMapperMock)
        sut.view = viewMock
    }

    override func tearDownWithError() throws {
        viewMock = nil
        infoViewModelMapperMock = nil
        selectorViewModelMapperMock = nil
        sut = nil
        super.tearDown()
    }

    func testViewDidLoad_shouldPopulateView() {
        // Given
        selectorViewModelMapperMock.mapWeatherMomentListReturnValue = [WeatherAppUtils.selectorViewModel]
        infoViewModelMapperMock.mapWeatherMomentReturnValue = WeatherAppUtils.infoViewModel
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(1, viewMock.reloadTableNumberOfCellsCallsCount)
        XCTAssertEqual(1, viewMock.setTitleTitleCallsCount)
        XCTAssertEqual(1, viewMock.setInfoViewInfoViewModelCallsCount)
    }

    func testConfigureCell_shouldCallLoadData() {
        // Given
        let cell = SelectorCellProtocolMock()
        selectorViewModelMapperMock.mapWeatherMomentListReturnValue = [WeatherAppUtils.selectorViewModel]
        infoViewModelMapperMock.mapWeatherMomentReturnValue = WeatherAppUtils.infoViewModel
        sut.viewDidLoad()
        
        // When
        sut.configureCell(index: 0, cell: cell)
        
        // Then
        XCTAssertEqual(1, cell.loadDataViewModelCallsCount)
    }
    
    func testCellPressed_shouldCallSetInfoView() {
        // Given
        infoViewModelMapperMock.mapWeatherMomentReturnValue = WeatherAppUtils.infoViewModel
        
        // When
        sut.cellPressed(index: 0)
        
        // Then
        XCTAssertEqual(1, viewMock.setInfoViewInfoViewModelCallsCount)
    }
    
}
