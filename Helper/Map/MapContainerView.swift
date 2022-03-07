//
//  MapView.swift
//  Helper
//
//  Created by Andrey on 07.03.2022.
//

import UIKit
import MapKit
import CoreLocation

class MapContainerView: UIView {
    
    var mapView = MKMapView()
    var completionLocationTapped: VoidCompletion?
    private let plusButton = UIButton()
    private let minusButton = UIButton()
    private let locationButton = UIButton()
 
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addSubview(plusButton)
        plusButton.setImage(UIImage.init(named: "plusButton"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
        plusButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.bottom.equalTo(-280)
            $0.trailing.equalTo(-20)
        }
        
        addSubview(minusButton)
        minusButton.setImage(UIImage.init(named: "minusButton"), for: .normal)
        minusButton.addTarget(self, action: #selector(minusButtonAction), for: .touchUpInside)
        minusButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.bottom.equalTo(plusButton.snp.bottom).offset(60)
            $0.trailing.equalTo(-20)
        }
        
        addSubview(locationButton)
        locationButton.setImage(UIImage.init(named: "locationButton"), for: .normal)
        locationButton.addTarget(self, action: #selector(locationButtonAction), for: .touchUpInside)
        locationButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.bottom.equalTo(minusButton.snp.top).offset(100)
            $0.trailing.equalTo(-20)
        }
    }
    
    @objc func plusButtonAction() {
        var region = mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView.setRegion(region, animated: true)
    }
    
    @objc func minusButtonAction() {
        var region: MKCoordinateRegion = mapView.region
        region.span.latitudeDelta = min(region.span.latitudeDelta * 2.0, 180.0)
        region.span.longitudeDelta = min(region.span.longitudeDelta * 2.0, 180.0)
        mapView.setRegion(region, animated: true)
    }
    
    @objc func locationButtonAction() {
        completionLocationTapped?()
    }
}
