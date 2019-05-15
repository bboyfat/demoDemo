//
//  MapViewController.swift
//  Tips-MartDemo
//
//  Created by Andrey Petrovskiy on 4/24/19.
//  Copyright © 2019 Andrey Petrovskiy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, UIGestureRecognizerDelegate {
   
    @IBOutlet var pullUpviewHeight: NSLayoutConstraint!
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var pullUPView: PullUpView!
    
    var cooredinates: [String: Double] = [:]
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        locationManager.delegate = self
        mapView.delegate = self
        getAccess()
        locationUpdate()
    }
    
    
    
    
    @IBAction func disVcBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func getAccess(){
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func addLocations(){
        
    }
    
    func locationUpdate(){
        if (CLLocationManager.locationServicesEnabled()) {
            
            locationManager.requestWhenInUseAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
}

extension MapViewController: MKMapViewDelegate{
   func dropPin(){
        
    }
    
}
extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("  kkk")
    }
    
}
