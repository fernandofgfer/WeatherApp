//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 23/4/21.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol { get }
    func reloadTable(numberOfCells: Int)
    func showError(message: String)
}

class HomeViewController: UITableViewController, HomeViewProtocol {
    
    var presenter: HomePresenterProtocol
    private var numberOfCells = 0
    
    // MARK: - Custom init
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(style: .plain)
    }
    
    // MARK: - Overrides
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setUpTable()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        view.backgroundColor = WeatherColors.backgroundMainColor
    }
    
    private func setUpTable() {
        tableView.register(HomeCell.self, forCellReuseIdentifier: String(describing: HomeCell.self))
        tableView.separatorStyle = .none
    }
    
    // MARK: - HomeViewProtocol
    
    func reloadTable(numberOfCells: Int) {
        self.numberOfCells = numberOfCells
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            self.showToast(message: message)
        }
    }
}

extension HomeViewController {
    
    // MARK: - TableView Delegates
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeCell.self), for: indexPath)
        presenter.configureCell(index: indexPath.row, cell: cell as? HomeCellProtocol)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellPressed(index: indexPath.row)
    }
}
