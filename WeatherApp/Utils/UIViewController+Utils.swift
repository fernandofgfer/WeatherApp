//
//  UIViewController+Utils.swift
//  WeatherApp
//
//  Created by Fernando Garcia Fernandez on 24/4/21.
//

import Foundation
import UIKit

extension UIViewController {

    func showToast(message: String, font: UIFont = .boldSystemFont(ofSize: 20.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: 200, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
    }
}
