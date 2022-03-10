//
//  WeatherContainerView.swift
//  Helper
//
//  Created by Andrey on 07.03.2022.
//

import UIKit

class WeatherContainerView: UIView {
    
    private let cityLabel = UILabel ()
    private let temperatureLabel = UILabel()
    private let cycloneLabel = UILabel()
    private let sunRiseLabel = UILabel()
    private let sunSetLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        cityLabel.text = Constants.cityTitle
        cityLabel.font = UIFont(name: "ABosaNova", size: 50)
        cityLabel.textColor = .black
        cityLabel.textAlignment = .center
        cityLabel.numberOfLines = 0
        
        temperatureLabel.text = Constants.temperatureTitle
        temperatureLabel.font = UIFont(name: "ABosaNova", size: 30)
        temperatureLabel.textColor = .black
        temperatureLabel.textAlignment = .center
        temperatureLabel.numberOfLines = 0
        
        cycloneLabel.text = Constants.cycloneTitle
        cycloneLabel.font = UIFont(name: "ABosaNova", size: 25)
        cycloneLabel.textColor = .black
        cycloneLabel.textAlignment = .center
        cycloneLabel.numberOfLines = 0
        
        sunRiseLabel.text = Constants.sunRiseTitle
        sunRiseLabel.font = UIFont(name: "ABosaNova", size: 20)
        sunRiseLabel.textColor = .black
        sunRiseLabel.textAlignment = .center
        sunRiseLabel.numberOfLines = 0
        
        sunSetLabel.text = Constants.sunSetTitle
        sunSetLabel.font = UIFont(name: "ABosaNova", size: 20)
        sunSetLabel.textColor = .black
        sunSetLabel.textAlignment = .center
        sunSetLabel.numberOfLines = 0
        
        backgroundColor = .white
        addSubViews(
            [cityLabel,
            temperatureLabel,
            cycloneLabel,
            sunSetLabel,
            sunRiseLabel]
        )
    }
    
    private func configureLayout() {
     
        cityLabel.snp.makeConstraints {
            $0.top.equalTo(200)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(40)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        cycloneLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(40)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        sunRiseLabel.snp.makeConstraints {
            $0.bottom.equalTo(-140)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        sunSetLabel.snp.makeConstraints {
            $0.top.equalTo(sunRiseLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
    }
}
