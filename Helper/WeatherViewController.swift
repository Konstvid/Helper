//
//  WeatherViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//

import Foundation
import UIKit

class WeatherVIewController: UIViewController {
    
    private let weatherCointainerView = WeatherContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
    }
    
    private func configure() {
        view.addSubview(weatherCointainerView)
        weatherCointainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func bind() {
        
    }
}


