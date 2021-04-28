//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation
import UIKit

/// sourcery: AutoMockable
protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol { get }
    func reloadTable(numberOfCells: Int)
    func setInfoView(infoViewModel: InfoViewModel)
    func setTitle(title: String?)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
    private enum Content {
        static let currentTemperature = "DetailViewController.currentTemperature"
        static let minTemperature = "DetailViewController.minTemperature"
        static let maxTemperature = "DetailViewController.maxTemperature"
        static let feelsLikeTemperature = "DetailViewController.feelsLikeTemperature"
        static let pressure = "DetailViewController.pressureTemperature"
        static let humidity = "DetailViewController.humidityTemperature"
    }
    
    private var numberOfCells = 0
    var presenter: DetailPresenterProtocol
    
    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private UI Elements
    fileprivate lazy var collection: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumInteritemSpacing = 10
        flow.minimumLineSpacing = 10
        
        var collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.allowsSelection = true
        collection.isScrollEnabled = true
        collection.backgroundColor = .clear
        return collection
    }()
    
    fileprivate lazy var currentTemperatureView: InfoView = {
        let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    fileprivate lazy var minTemperatureView: InfoView = {
        let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    fileprivate lazy var maxTemperatureView: InfoView = {
        let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    fileprivate lazy var feelsLikeTemperatureView: InfoView = {
        let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    fileprivate lazy var pressureView: InfoView = {
        let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    fileprivate lazy var humidityView: InfoView = {
        let infoView = InfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        return infoView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        presenter.viewDidLoad()
    }
    
    func setupViews() {
        view.backgroundColor = WeatherColors.backgroundMainColor
        
        view.addSubview(collection)
        view.addSubview(currentTemperatureView)
        view.addSubview(minTemperatureView)
        view.addSubview(maxTemperatureView)
        view.addSubview(feelsLikeTemperatureView)
        view.addSubview(pressureView)
        view.addSubview(humidityView)
        collection.delegate = self
        collection.dataSource = self
        collection.register(SelectorCell.self, forCellWithReuseIdentifier: String(describing: SelectorCell.self))
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            collection.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 200),
            
            currentTemperatureView.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 20),
            currentTemperatureView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            currentTemperatureView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            currentTemperatureView.heightAnchor.constraint(equalToConstant: 50),
            
            minTemperatureView.topAnchor.constraint(equalTo: currentTemperatureView.bottomAnchor, constant: 10),
            minTemperatureView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            minTemperatureView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            minTemperatureView.heightAnchor.constraint(equalToConstant: 50),
            
            maxTemperatureView.topAnchor.constraint(equalTo: minTemperatureView.bottomAnchor, constant: 10),
            maxTemperatureView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            maxTemperatureView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            maxTemperatureView.heightAnchor.constraint(equalToConstant: 50),
            
            feelsLikeTemperatureView.topAnchor.constraint(equalTo: maxTemperatureView.bottomAnchor, constant: 10),
            feelsLikeTemperatureView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            feelsLikeTemperatureView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            feelsLikeTemperatureView.heightAnchor.constraint(equalToConstant: 50),
            
            pressureView.topAnchor.constraint(equalTo: feelsLikeTemperatureView.bottomAnchor, constant: 10),
            pressureView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            pressureView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            pressureView.heightAnchor.constraint(equalToConstant: 50),
            
            humidityView.topAnchor.constraint(equalTo: pressureView.bottomAnchor, constant: 10),
            humidityView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            humidityView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            humidityView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func reloadTable(numberOfCells: Int) {
        self.numberOfCells = numberOfCells
        DispatchQueue.main.async {
            self.collection.reloadData()
            self.collection.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
        }
    }
    
    func setTitle(title: String?) {
        self.title = title
    }
    
    func setInfoView(infoViewModel: InfoViewModel) {
        currentTemperatureView.setData(title: NSLocalizedString(Content.currentTemperature, comment: ""), data: infoViewModel.currentTemperature)
        minTemperatureView.setData(title: NSLocalizedString(Content.minTemperature, comment: ""), data: infoViewModel.minTemperature)
        maxTemperatureView.setData(title: NSLocalizedString(Content.maxTemperature, comment: ""), data: infoViewModel.maxTemperature)
        feelsLikeTemperatureView.setData(title: NSLocalizedString(Content.feelsLikeTemperature, comment: ""), data: infoViewModel.feelsLikeTemperature)
        pressureView.setData(title: NSLocalizedString(Content.pressure, comment: ""), data: infoViewModel.pression)
        humidityView.setData(title: NSLocalizedString(Content.humidity, comment: ""), data: infoViewModel.humidity)
    }

}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SelectorCell.self), for: indexPath)
        presenter.configureCell(index: indexPath.row, cell: cell as? SelectorCellProtocol)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.cellPressed(index: indexPath.row)
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
}
