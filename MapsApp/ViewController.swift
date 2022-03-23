//
//  ViewController.swift
//  MapsApp
//
//  Created by Eldiiar on 23/3/22.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {
    
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyAGRXT_onme_VsfBV1vVufktUaBFmS8PCc")
        view.backgroundColor = .white
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            manager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 12.0)
            let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
            view.addSubview(mapView)
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            marker.icon = UIImage(named: "user-location")
            marker.title = "Your current location"
            marker.map = mapView
            
            markers(mapView)
        }
        
    }
    
    func markers(_ mapView: GMSMapView) {
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 42.876148, longitude: 74.614476)
        marker1.title = "Tsum"
        marker1.snippet = "Shopping Mall"
        marker1.icon = UIImage(named: "shopping-cart")
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 42.855697, longitude: 74.584990)
        marker2.title = "Asia Mall"
        marker2.snippet = "Shopping Mall"
        marker2.icon = UIImage(named: "shopping-cart")
        marker2.map = mapView
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 42.85586610980684, longitude: 74.68125487096944)
        marker3.title = "Alatoo International University"
        marker3.snippet = "Educational Instutution"
        marker3.icon = UIImage(named: "university")
        marker3.map = mapView
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 42.81065671743096, longitude: 74.62729870606766)
        marker4.title = "AUCA"
        marker4.snippet = "Educational Instutution"
        marker4.icon = UIImage(named: "university")
        marker4.map = mapView
    }
}
