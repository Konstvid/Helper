//
//  WeatherViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//

import Foundation
import UIKit

class WeatherVIewController: UIViewController {
    
    private let viewModel: WeatherViewModelProtocol
    private let weatherCointainerView = WeatherContainerView()
    
    init(viewModel: WeatherViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
        bind()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
