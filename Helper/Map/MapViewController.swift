//
//  MapViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
import SnapKit

class MapViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    var mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
    }
    
    func configureMapView() {
        view.addSubview(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configure() {
        view.backgroundColor = .white
    }
    
    private func bind() {
        
    }
    
    private func configureLM() {
        guard CLLocationManager.locationServicesEnabled() else { return }
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        mapView.completionLocationTapped = { [weak self] in
//            self?.locationManager?.startUpdatingLocation()
//        }
        locationManager?.startUpdatingLocation()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
    }
}
