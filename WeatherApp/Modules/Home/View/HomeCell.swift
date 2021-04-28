//
//  HomeCell.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 23/4/21.
//

import Foundation
import UIKit
import SDWebImage

/// sourcery: AutoMockable
protocol HomeCellProtocol {
    func loadData(viewModel: HomeViewModel)
}

class HomeCell: UITableViewCell {
    
    private var gradientLayer: CAGradientLayer = CAGradientLayer()
    
    // MARK: - Private UI Elements
    fileprivate lazy var cityLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    fileprivate lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    fileprivate lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    fileprivate lazy var weatherImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    fileprivate lazy var leftStackView: UIStackView = {
       var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Overrides
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        setUpStyles()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.frame
    }

    // MARK: - Private methods
    
    private func setupView() {
        leftStackView.addArrangedSubview(cityLabel)
        leftStackView.addArrangedSubview(dateLabel)
        
        contentView.addSubview(leftStackView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(weatherImage)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            leftStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            leftStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            leftStackView.widthAnchor.constraint(equalToConstant: 100),
    
            weatherImage.heightAnchor.constraint(equalToConstant: 40),
            weatherImage.widthAnchor.constraint(equalToConstant: 40),
            weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30.0)
        ])
    }
    
    private func setUpStyles() {
        
        // Border
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 10
        
        // Shadow
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        
        // Background
        backgroundColor = .clear
        
        let color1 = WeatherColors.cellTopColor
        let color2 = WeatherColors.cellBottomColor
        gradientLayer.colors = [color1?.cgColor ?? .init(gray: 1, alpha: 1), color2?.cgColor ?? .init(gray: 1, alpha: 1)]
        gradientLayer.cornerRadius = 10
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
}

// MARK: - HomeCellProtocol

extension HomeCell: HomeCellProtocol {
    func loadData(viewModel: HomeViewModel) {
        cityLabel.text = viewModel.city
        dateLabel.text = viewModel.getFormattedDate()
        descriptionLabel.text = viewModel.description.capitalized
        weatherImage.sd_setImage(with: URL(string: viewModel.image), completed: nil)
    }
}
