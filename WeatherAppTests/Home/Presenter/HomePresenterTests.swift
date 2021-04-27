//
//  HomePresenterTests.swift
//  WeatherAppTests
//
//  Created by Fernando Garcia Fernandez on 25/4/21.
//

import XCTest
@testable import WeatherApp

class HomePresenterTests: XCTestCase {

    var sut: HomePresenter!
    var interactorMock: HomeInteractorProtocolMock!
    var viewModelFactoryMock: HomeViewModelFactoryProtocolMock!
    var viewMock: HomeViewProtocolMock!
    var routerMock: HomeRouterProtocolMock!
    
    override func setUpWithError() throws {
        super.setUp()
        interactorMock = HomeInteractorProtocolMock()
        viewModelFactoryMock = HomeViewModelFactoryProtocolMock()
        routerMock = HomeRouterProtocolMock()
        sut = HomePresenter(interactor: interactorMock,
                            homeViewModelFactory: viewModelFactoryMock,
                            router: routerMock)
        viewMock = HomeViewProtocolMock()
        sut.view = viewMock
    }

    override func tearDownWithError() throws {
        viewMock = nil
        viewModelFactoryMock = nil
        interactorMock = nil
        sut = nil
        super.tearDown()
    }
    
    func testViewDidLoad_shouldCallFetchWeatherData() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(1, interactorMock.fetchWeatherDataCallsCount)
    }
    
    func testConfigureCell_shoudlCallLoadData() {
        // Given
        let cell = HomeCellProtocolMock()
        viewModelFactoryMock.createViewModelWeatherMomentListReturnValue = [WeatherAppUtils.homeViewModel]
        sut.weatherDataReturned(weather: [])
        
        // When
        sut.configureCell(index: 0, cell: cell)
        
        // Then
        XCTAssertEqual(1, cell.loadDataViewModelCallsCount)
    }
    
    func testCellPressed_shouldCallPushToDetailedView_withProperlyData() {
        // Given
        let weatherMoment = WeatherAppUtils.weatherMoment
        viewModelFactoryMock.createViewModelWeatherMomentListReturnValue = [WeatherAppUtils.homeViewModel]
        sut.weatherDataReturned(weather: [weatherMoment])
        
        // When
        sut.cellPressed(index: 0)
        
        // Then
        XCTAssertEqual(1, routerMock.pushToDetailedViewWeatherMomentListCallsCount)
        XCTAssertEqual(weatherMoment, routerMock.pushToDetailedViewWeatherMomentListReceivedWeatherMomentList?.first)
    }
        
    func testWeatherDataReturned_shouldCallReloadTable() {
        // Given
        viewModelFactoryMock.createViewModelWeatherMomentListReturnValue = []
        
        // When
        sut.weatherDataReturned(weather: [])
        
        // Then
        XCTAssertEqual(1, viewMock.reloadTableNumberOfCellsCallsCount)
    }
    
    func testShowError_shouldCallShowError() {
        // When
        sut.showError(message: "")
        
        // Then
        XCTAssertEqual(1, viewMock.showErrorMessageCallsCount)
    }
    
}
