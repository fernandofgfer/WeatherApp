//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol { get }
    func reloadTable(numberOfCells: Int)
}

class DetailViewController: UIViewController, DetailViewProtocol {
    
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
        flow.minimumInteritemSpacing = 0
        flow.minimumLineSpacing = 0
        
        var collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.allowsSelection = true
        collection.backgroundColor = .red
        collection.isScrollEnabled = true
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        presenter.viewDidLoad()
    }
    
    func setupViews() {
        view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        collection.register(SelectorCell.self, forCellWithReuseIdentifier: String(describing: SelectorCell.self))
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            collection.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collection.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    func reloadTable(numberOfCells: Int) {
        self.numberOfCells = numberOfCells
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
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
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 140)
    }
}
