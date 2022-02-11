//
//  MapViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapViewModel: MapViewModel?
    private let mapContainerView = MapContainerView()
    private var locationManager: CLLocationManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureLM()
    }

    private func configure() {
        view.addSubview(mapContainerView)
        mapContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
 
    private func configureLM() {
        guard CLLocationManager.locationServicesEnabled() else { return }
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
        mapContainerView.completionLocationTapped = { [weak self] in
            self?.locationManager?.startUpdatingLocation()
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationManager?.stopUpdatingLocation()
        let center = CLLocationCoordinate2D(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        )
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = Constants.title
        pin.subtitle = Constants.subtitle
        mapContainerView.mapView.addAnnotation(pin)
        let region = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        mapContainerView.mapView.setRegion(region, animated: true)
    }
}
