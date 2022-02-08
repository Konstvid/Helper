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
    
    // Action Button
//    private func actionButton() {
//        plusButton.addTarget(self, action: , for: )
//        minusButton.addTarget(self, action: , for: )
//        locationButton.addTarget(self, action: , for: )
//    }
    
    private func configure() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
        $0.edges.equalToSuperview()
            
        view.addSubview(plusButton)
            plusButton.setImage(UIImage.init(named: "plusButton"), for: .normal)
            plusButton.snp.makeConstraints {
                $0.size.equalTo(44)
                $0.bottom.equalTo(-280)
                $0.trailing.equalTo(-20)
            }
            
        view.addSubview(minusButton)
            minusButton.setImage(UIImage.init(named: "minusButton"), for: .normal)
            minusButton.snp.makeConstraints {
                $0.size.equalTo(44)
                $0.bottom.equalTo(plusButton.snp.bottom).offset(60)
                $0.trailing.equalTo(-20)
            }
            
        view.addSubview(locationButton)
            locationButton.setImage(UIImage.init(named: "locationButton"), for: .normal)
            locationButton.snp.makeConstraints {
                $0.size.equalTo(44)
                $0.bottom.equalTo(minusButton.snp.top).offset(100)
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
        pin.title = Constants.title
        pin.subtitle = Constants.subtitle
        mapView.addAnnotation(pin)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
}

