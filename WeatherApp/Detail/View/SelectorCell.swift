//
//  SelectorCell.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 26/4/21.
//

import Foundation
import UIKit

protocol SelectorCellProtocol {
    func loadData(viewModel: SelectorViewModel)
}

class SelectorCell: UICollectionViewCell {
    
    // MARK: - Private UI Elements
    fileprivate lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    fileprivate lazy var hourLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    fileprivate lazy var weatherImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate lazy var stackView: UIStackView = {
       var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading;
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        setupStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(hourLabel)
        stackView.addArrangedSubview(weatherImage)
        
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor)
        ])
    }
    
    private func setupStyles() {
        // Border
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 10
        
        
        // Shadow
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
    }
}

extension SelectorCell: SelectorCellProtocol {
    func loadData(viewModel: SelectorViewModel) {
        dateLabel.text = String(viewModel.day)
        hourLabel.text = String(viewModel.hour)
        weatherImage.image = .add
    }
}
