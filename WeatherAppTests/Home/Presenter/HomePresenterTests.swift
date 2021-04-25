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
    
    override func setUpWithError() throws {
        super.setUp()
        interactorMock = HomeInteractorProtocolMock()
        viewModelFactoryMock = HomeViewModelFactoryProtocolMock()
        sut = HomePresenter(interactor: interactorMock,
                            homeViewModelFactory: viewModelFactoryMock)
        viewMock = HomeViewProtocolMock(presenter: sut)
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
        XCTAssertEqual(1, interactorMock.fetchWeatherDataCalledCount)
    }
    
    func testWeatherDataReturned_shouldCallReloadTable() {
        // When
        sut.weatherDataReturned(weather: [])
        
        // Then
        XCTAssertEqual(1, viewMock.reloadTableCalledCount)
    }
    
    func testShowError_shouldCallShowError() {
        // When
        sut.showError(message: "")
        
        // Then
        XCTAssertEqual(1, viewMock.showErrorCalledCount)
    }
    
}

class HomeViewProtocolMock: HomeViewProtocol {
    var presenter: HomePresenterProtocol
    
    var reloadTableCalled = false
    var reloadTableCalledCount = 0
    var showErrorCalled = false
    var showErrorCalledCount = 0
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
    
    func reloadTable(numberOfCells: Int) {
        reloadTableCalled = true
        reloadTableCalledCount += 1
    }
    
    func showError(message: String) {
        showErrorCalled = true
        showErrorCalledCount += 1
    }
}

class HomeInteractorProtocolMock: HomeInteractorProtocol {
    
    var fetchWeatherDataCalled = false
    var fetchWeatherDataCalledCount = 0
    
    func fetchWeatherData() {
        fetchWeatherDataCalled = true
        fetchWeatherDataCalledCount += 1
    }
}

class HomeViewModelFactoryProtocolMock: HomeViewModelFactoryProtocol {
    
    var createViewModelCalled = false
    var createViewModelCalledCount = 0
    
    func createViewModel(weatherMomentList: [WeatherMoment]) -> [HomeViewModel] {
        createViewModelCalled = true
        createViewModelCalledCount += 1
        return []
    }
}
