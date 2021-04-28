@testable import WeatherApp
// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class DetailPresenterProtocolMock: DetailPresenterProtocol {
    var view: DetailViewProtocol?

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - configureCell

    var configureCellIndexCellCallsCount = 0
    var configureCellIndexCellCalled: Bool {
        return configureCellIndexCellCallsCount > 0
    }
    var configureCellIndexCellReceivedArguments: (index: Int, cell: SelectorCellProtocol?)?
    var configureCellIndexCellReceivedInvocations: [(index: Int, cell: SelectorCellProtocol?)] = []
    var configureCellIndexCellClosure: ((Int, SelectorCellProtocol?) -> Void)?

    func configureCell(index: Int, cell: SelectorCellProtocol?) {
        configureCellIndexCellCallsCount += 1
        configureCellIndexCellReceivedArguments = (index: index, cell: cell)
        configureCellIndexCellReceivedInvocations.append((index: index, cell: cell))
        configureCellIndexCellClosure?(index, cell)
    }

    //MARK: - cellPressed

    var cellPressedIndexCallsCount = 0
    var cellPressedIndexCalled: Bool {
        return cellPressedIndexCallsCount > 0
    }
    var cellPressedIndexReceivedIndex: Int?
    var cellPressedIndexReceivedInvocations: [Int] = []
    var cellPressedIndexClosure: ((Int) -> Void)?

    func cellPressed(index: Int) {
        cellPressedIndexCallsCount += 1
        cellPressedIndexReceivedIndex = index
        cellPressedIndexReceivedInvocations.append(index)
        cellPressedIndexClosure?(index)
    }

}
class DetailViewProtocolMock: DetailViewProtocol {
    var presenter: DetailPresenterProtocol {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: DetailPresenterProtocol!

    //MARK: - reloadTable

    var reloadTableNumberOfCellsCallsCount = 0
    var reloadTableNumberOfCellsCalled: Bool {
        return reloadTableNumberOfCellsCallsCount > 0
    }
    var reloadTableNumberOfCellsReceivedNumberOfCells: Int?
    var reloadTableNumberOfCellsReceivedInvocations: [Int] = []
    var reloadTableNumberOfCellsClosure: ((Int) -> Void)?

    func reloadTable(numberOfCells: Int) {
        reloadTableNumberOfCellsCallsCount += 1
        reloadTableNumberOfCellsReceivedNumberOfCells = numberOfCells
        reloadTableNumberOfCellsReceivedInvocations.append(numberOfCells)
        reloadTableNumberOfCellsClosure?(numberOfCells)
    }

    //MARK: - setInfoView

    var setInfoViewInfoViewModelCallsCount = 0
    var setInfoViewInfoViewModelCalled: Bool {
        return setInfoViewInfoViewModelCallsCount > 0
    }
    var setInfoViewInfoViewModelReceivedInfoViewModel: InfoViewModel?
    var setInfoViewInfoViewModelReceivedInvocations: [InfoViewModel] = []
    var setInfoViewInfoViewModelClosure: ((InfoViewModel) -> Void)?

    func setInfoView(infoViewModel: InfoViewModel) {
        setInfoViewInfoViewModelCallsCount += 1
        setInfoViewInfoViewModelReceivedInfoViewModel = infoViewModel
        setInfoViewInfoViewModelReceivedInvocations.append(infoViewModel)
        setInfoViewInfoViewModelClosure?(infoViewModel)
    }

    //MARK: - setTitle

    var setTitleTitleCallsCount = 0
    var setTitleTitleCalled: Bool {
        return setTitleTitleCallsCount > 0
    }
    var setTitleTitleReceivedTitle: String?
    var setTitleTitleReceivedInvocations: [String?] = []
    var setTitleTitleClosure: ((String?) -> Void)?

    func setTitle(title: String?) {
        setTitleTitleCallsCount += 1
        setTitleTitleReceivedTitle = title
        setTitleTitleReceivedInvocations.append(title)
        setTitleTitleClosure?(title)
    }

}
class HomeCellProtocolMock: HomeCellProtocol {

    //MARK: - loadData

    var loadDataViewModelCallsCount = 0
    var loadDataViewModelCalled: Bool {
        return loadDataViewModelCallsCount > 0
    }
    var loadDataViewModelReceivedViewModel: HomeViewModel?
    var loadDataViewModelReceivedInvocations: [HomeViewModel] = []
    var loadDataViewModelClosure: ((HomeViewModel) -> Void)?

    func loadData(viewModel: HomeViewModel) {
        loadDataViewModelCallsCount += 1
        loadDataViewModelReceivedViewModel = viewModel
        loadDataViewModelReceivedInvocations.append(viewModel)
        loadDataViewModelClosure?(viewModel)
    }

}
class HomeInteractorOutputProtocolMock: HomeInteractorOutputProtocol {

    //MARK: - weatherDataReturned

    var weatherDataReturnedWeatherCallsCount = 0
    var weatherDataReturnedWeatherCalled: Bool {
        return weatherDataReturnedWeatherCallsCount > 0
    }
    var weatherDataReturnedWeatherReceivedWeather: [WeatherMoment]?
    var weatherDataReturnedWeatherReceivedInvocations: [[WeatherMoment]] = []
    var weatherDataReturnedWeatherClosure: (([WeatherMoment]) -> Void)?

    func weatherDataReturned(weather: [WeatherMoment]) {
        weatherDataReturnedWeatherCallsCount += 1
        weatherDataReturnedWeatherReceivedWeather = weather
        weatherDataReturnedWeatherReceivedInvocations.append(weather)
        weatherDataReturnedWeatherClosure?(weather)
    }

    //MARK: - showError

    var showErrorMessageCallsCount = 0
    var showErrorMessageCalled: Bool {
        return showErrorMessageCallsCount > 0
    }
    var showErrorMessageReceivedMessage: String?
    var showErrorMessageReceivedInvocations: [String] = []
    var showErrorMessageClosure: ((String) -> Void)?

    func showError(message: String) {
        showErrorMessageCallsCount += 1
        showErrorMessageReceivedMessage = message
        showErrorMessageReceivedInvocations.append(message)
        showErrorMessageClosure?(message)
    }

}
class HomeInteractorProtocolMock: HomeInteractorProtocol {
    var presenter: HomeInteractorOutputProtocol?

    //MARK: - fetchWeatherData

    var fetchWeatherDataCallsCount = 0
    var fetchWeatherDataCalled: Bool {
        return fetchWeatherDataCallsCount > 0
    }
    var fetchWeatherDataClosure: (() -> Void)?

    func fetchWeatherData() {
        fetchWeatherDataCallsCount += 1
        fetchWeatherDataClosure?()
    }

}
class HomePresenterProtocolMock: HomePresenterProtocol {
    var view: HomeViewProtocol?

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - configureCell

    var configureCellIndexCellCallsCount = 0
    var configureCellIndexCellCalled: Bool {
        return configureCellIndexCellCallsCount > 0
    }
    var configureCellIndexCellReceivedArguments: (index: Int, cell: HomeCellProtocol?)?
    var configureCellIndexCellReceivedInvocations: [(index: Int, cell: HomeCellProtocol?)] = []
    var configureCellIndexCellClosure: ((Int, HomeCellProtocol?) -> Void)?

    func configureCell(index: Int, cell: HomeCellProtocol?) {
        configureCellIndexCellCallsCount += 1
        configureCellIndexCellReceivedArguments = (index: index, cell: cell)
        configureCellIndexCellReceivedInvocations.append((index: index, cell: cell))
        configureCellIndexCellClosure?(index, cell)
    }

    //MARK: - cellPressed

    var cellPressedIndexCallsCount = 0
    var cellPressedIndexCalled: Bool {
        return cellPressedIndexCallsCount > 0
    }
    var cellPressedIndexReceivedIndex: Int?
    var cellPressedIndexReceivedInvocations: [Int] = []
    var cellPressedIndexClosure: ((Int) -> Void)?

    func cellPressed(index: Int) {
        cellPressedIndexCallsCount += 1
        cellPressedIndexReceivedIndex = index
        cellPressedIndexReceivedInvocations.append(index)
        cellPressedIndexClosure?(index)
    }

}
class HomeRouterProtocolMock: HomeRouterProtocol {

    //MARK: - pushToDetailedView

    var pushToDetailedViewWeatherMomentListCallsCount = 0
    var pushToDetailedViewWeatherMomentListCalled: Bool {
        return pushToDetailedViewWeatherMomentListCallsCount > 0
    }
    var pushToDetailedViewWeatherMomentListReceivedWeatherMomentList: [WeatherMoment]?
    var pushToDetailedViewWeatherMomentListReceivedInvocations: [[WeatherMoment]] = []
    var pushToDetailedViewWeatherMomentListClosure: (([WeatherMoment]) -> Void)?

    func pushToDetailedView(weatherMomentList: [WeatherMoment]) {
        pushToDetailedViewWeatherMomentListCallsCount += 1
        pushToDetailedViewWeatherMomentListReceivedWeatherMomentList = weatherMomentList
        pushToDetailedViewWeatherMomentListReceivedInvocations.append(weatherMomentList)
        pushToDetailedViewWeatherMomentListClosure?(weatherMomentList)
    }

}
class HomeViewModelFactoryProtocolMock: HomeViewModelMapperProtocol {

    //MARK: - createViewModel

    var createViewModelWeatherMomentListCallsCount = 0
    var createViewModelWeatherMomentListCalled: Bool {
        return createViewModelWeatherMomentListCallsCount > 0
    }
    var createViewModelWeatherMomentListReceivedWeatherMomentList: [WeatherMoment]?
    var createViewModelWeatherMomentListReceivedInvocations: [[WeatherMoment]] = []
    var createViewModelWeatherMomentListReturnValue: [HomeViewModel]!
    var createViewModelWeatherMomentListClosure: (([WeatherMoment]) -> [HomeViewModel])?

    func createViewModel(weatherMomentList: [WeatherMoment]) -> [HomeViewModel] {
        createViewModelWeatherMomentListCallsCount += 1
        createViewModelWeatherMomentListReceivedWeatherMomentList = weatherMomentList
        createViewModelWeatherMomentListReceivedInvocations.append(weatherMomentList)
        return createViewModelWeatherMomentListClosure.map({ $0(weatherMomentList) }) ?? createViewModelWeatherMomentListReturnValue
    }

}
class HomeViewProtocolMock: HomeViewProtocol {
    var presenter: HomePresenterProtocol {
        get { return underlyingPresenter }
        set(value) { underlyingPresenter = value }
    }
    var underlyingPresenter: HomePresenterProtocol!

    //MARK: - reloadTable

    var reloadTableNumberOfCellsCallsCount = 0
    var reloadTableNumberOfCellsCalled: Bool {
        return reloadTableNumberOfCellsCallsCount > 0
    }
    var reloadTableNumberOfCellsReceivedNumberOfCells: Int?
    var reloadTableNumberOfCellsReceivedInvocations: [Int] = []
    var reloadTableNumberOfCellsClosure: ((Int) -> Void)?

    func reloadTable(numberOfCells: Int) {
        reloadTableNumberOfCellsCallsCount += 1
        reloadTableNumberOfCellsReceivedNumberOfCells = numberOfCells
        reloadTableNumberOfCellsReceivedInvocations.append(numberOfCells)
        reloadTableNumberOfCellsClosure?(numberOfCells)
    }

    //MARK: - showError

    var showErrorMessageCallsCount = 0
    var showErrorMessageCalled: Bool {
        return showErrorMessageCallsCount > 0
    }
    var showErrorMessageReceivedMessage: String?
    var showErrorMessageReceivedInvocations: [String] = []
    var showErrorMessageClosure: ((String) -> Void)?

    func showError(message: String) {
        showErrorMessageCallsCount += 1
        showErrorMessageReceivedMessage = message
        showErrorMessageReceivedInvocations.append(message)
        showErrorMessageClosure?(message)
    }

}
class InfoViewModelMapperProtocolMock: InfoViewModelMapperProtocol {

    //MARK: - map

    var mapWeatherMomentCallsCount = 0
    var mapWeatherMomentCalled: Bool {
        return mapWeatherMomentCallsCount > 0
    }
    var mapWeatherMomentReceivedWeatherMoment: WeatherMoment?
    var mapWeatherMomentReceivedInvocations: [WeatherMoment] = []
    var mapWeatherMomentReturnValue: InfoViewModel!
    var mapWeatherMomentClosure: ((WeatherMoment) -> InfoViewModel)?

    func map(weatherMoment: WeatherMoment) -> InfoViewModel {
        mapWeatherMomentCallsCount += 1
        mapWeatherMomentReceivedWeatherMoment = weatherMoment
        mapWeatherMomentReceivedInvocations.append(weatherMoment)
        return mapWeatherMomentClosure.map({ $0(weatherMoment) }) ?? mapWeatherMomentReturnValue
    }

}
class SelectorCellProtocolMock: SelectorCellProtocol {

    //MARK: - loadData

    var loadDataViewModelCallsCount = 0
    var loadDataViewModelCalled: Bool {
        return loadDataViewModelCallsCount > 0
    }
    var loadDataViewModelReceivedViewModel: SelectorViewModel?
    var loadDataViewModelReceivedInvocations: [SelectorViewModel] = []
    var loadDataViewModelClosure: ((SelectorViewModel) -> Void)?

    func loadData(viewModel: SelectorViewModel) {
        loadDataViewModelCallsCount += 1
        loadDataViewModelReceivedViewModel = viewModel
        loadDataViewModelReceivedInvocations.append(viewModel)
        loadDataViewModelClosure?(viewModel)
    }

}
class SelectorViewModelMapperProtocolMock: SelectorViewModelMapperProtocol {

    //MARK: - map

    var mapWeatherMomentListCallsCount = 0
    var mapWeatherMomentListCalled: Bool {
        return mapWeatherMomentListCallsCount > 0
    }
    var mapWeatherMomentListReceivedWeatherMomentList: [WeatherMoment]?
    var mapWeatherMomentListReceivedInvocations: [[WeatherMoment]] = []
    var mapWeatherMomentListReturnValue: [SelectorViewModel]!
    var mapWeatherMomentListClosure: (([WeatherMoment]) -> [SelectorViewModel])?

    func map(weatherMomentList: [WeatherMoment]) -> [SelectorViewModel] {
        mapWeatherMomentListCallsCount += 1
        mapWeatherMomentListReceivedWeatherMomentList = weatherMomentList
        mapWeatherMomentListReceivedInvocations.append(weatherMomentList)
        return mapWeatherMomentListClosure.map({ $0(weatherMomentList) }) ?? mapWeatherMomentListReturnValue
    }

}
class WeatherDataManagerProtocolMock: WeatherDataManagerProtocol {

    //MARK: - fetch

    var fetchLocationCompletionCallsCount = 0
    var fetchLocationCompletionCalled: Bool {
        return fetchLocationCompletionCallsCount > 0
    }
    var fetchLocationCompletionReceivedArguments: (location: String, completion: (Result<WeatherDTO, ApiClientError>) -> Void)?
    var fetchLocationCompletionReceivedInvocations: [(location: String, completion: (Result<WeatherDTO, ApiClientError>) -> Void)] = []
    var fetchLocationCompletionClosure: ((String, @escaping (Result<WeatherDTO, ApiClientError>) -> Void) -> Void)?

    func fetch(location: String, completion: @escaping (Result<WeatherDTO, ApiClientError>) -> Void) {
        fetchLocationCompletionCallsCount += 1
        fetchLocationCompletionReceivedArguments = (location: location, completion: completion)
        fetchLocationCompletionReceivedInvocations.append((location: location, completion: completion))
        fetchLocationCompletionClosure?(location, completion)
    }

}
class WeatherMomentMapperProtocolMock: WeatherMomentMapperProtocol {

    //MARK: - map

    var mapWeatherDTOCityCallsCount = 0
    var mapWeatherDTOCityCalled: Bool {
        return mapWeatherDTOCityCallsCount > 0
    }
    var mapWeatherDTOCityReceivedArguments: (weatherDTO: WeatherDTO, city: String)?
    var mapWeatherDTOCityReceivedInvocations: [(weatherDTO: WeatherDTO, city: String)] = []
    var mapWeatherDTOCityReturnValue: [WeatherMoment]!
    var mapWeatherDTOCityClosure: ((WeatherDTO, String) -> [WeatherMoment])?

    func map(weatherDTO: WeatherDTO, city: String) -> [WeatherMoment] {
        mapWeatherDTOCityCallsCount += 1
        mapWeatherDTOCityReceivedArguments = (weatherDTO: weatherDTO, city: city)
        mapWeatherDTOCityReceivedInvocations.append((weatherDTO: weatherDTO, city: city))
        return mapWeatherDTOCityClosure.map({ $0(weatherDTO, city) }) ?? mapWeatherDTOCityReturnValue
    }

}
