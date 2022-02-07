//
//  MapViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//


import UIKit
import MapKit
import CoreLocation
import SnapKit

class MapViewController: UIViewController {
    
    let plusButton = UIButton()
    let minusButton = UIButton()
    let locationButton = UIButton()
    
    private var locationManager: CLLocationManager?
    private var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func bind() {

    }
    
    private func configure() {
        view.addSubview(mapView)
        view.backgroundColor = .white
        mapView.snp.makeConstraints {
        $0.edges.equalToSuperview()
            
        view.addSubview(plusButton)
            plusButton.setTitle("+", for: .normal)
            plusButton.layer.cornerRadius = 14
            plusButton.backgroundColor = .white
            plusButton.setTitleColor(.black, for: .normal)
            plusButton.snp.makeConstraints {
                $0.bottom.equalTo(-100)
                $0.trailing.equalTo(-20)
            }
            
        view.addSubview(minusButton)
            minusButton.setTitle("-", for: .normal)
            minusButton.layer.cornerRadius = 14
            minusButton.backgroundColor = .white
            minusButton.setTitleColor(.black, for: .normal)
            minusButton.snp.makeConstraints {
                $0.top.equalTo(plusButton.snp.bottom).offset(20)
                $0.trailing.equalTo(-20)
            }
            
        view.addSubview(locationButton)
            locationButton.setTitle("✓", for: .normal)
            locationButton.layer.cornerRadius = 14
            locationButton.setTitleColor(.black, for: .normal)
            locationButton.backgroundColor = .white
            locationButton.snp.makeConstraints {
                $0.top.equalTo(minusButton.snp.bottom).offset(20)
                $0.trailing.equalTo(-20)
            }
        
    }
    }
    
    private func configureLM() {
        guard CLLocationManager.locationServicesEnabled() else { return }
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }
        
}
    
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                            longitude: location.coordinate.longitude)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = "Вы тута"
        pin.subtitle = "Двигаемся:)"
        mapView.addAnnotation(pin)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
}

