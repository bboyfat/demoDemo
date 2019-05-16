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
import Alamofire
import AlamofireImage


class MapViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet var pullUpviewHeight: NSLayoutConstraint!
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var pullUPView: PullUpView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var coordinates: [ShopsCoordinates] = []
    var locations: [Locations] = []
    var imageUrlArray: [String] = []
    var imageArray: [UIImage] = []
    
    let apiManager = MapAPI()
    var regionRadius: Double = 1000
    
    let screenSizee = UIScreen.main.bounds.height
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getData()
        configureLocationServices()
        centerMapOnUserLocation()
        mapView.showsUserLocation = true
        locationManager.delegate = self
        mapView.delegate = self
    }
    
    func addSwipe(){
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(hidePullMenu))
        swipe.direction = .down
        pullUPView.addGestureRecognizer(swipe)
    }
    
    @objc func hidePullMenu(){
        pullUpviewHeight.constant = 100
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    
    @IBAction func disVcBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func addLocations(){
        var annotations: [DroppablePin] = []
        coordinates.forEach { (coordinates) in
            coordinates.locations.forEach({ (lonLat) in
                self.locations.append(lonLat)
                let coordinates = CLLocationCoordinate2D(latitude: lonLat.x, longitude: lonLat.y)
                let annotation = DroppablePin(coordinate: coordinates, identifier: "tipsShop")
                annotations.append(annotation)
            })
            
            mapView.addAnnotations(annotations)
        }
    }
    
    
    
    func getData(){
        apiManager.getLocation { (finished) in
            if finished{
                self.coordinates = self.apiManager.coordinates
                self.imageUrlArray = self.apiManager.imageUrlArray
                self.addLocations()
                self.addSwipe()
                self.apiManager.getImages(handler: { (finished) in
                    if finished{
                        self.imageArray = self.apiManager.imageArray
                        
                    }
                })
            }
        }
    }
    
}

extension MapViewController: MKMapViewDelegate{
    func centerMapOnUserLocation(){
        guard let coordinate = locationManager.location?.coordinate else { return }
        let coordinateRegion = MKCoordinateRegion(center: coordinate , latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "tipsShop")
        view.animatesDrop = true
        view.pinTintColor = .purple
        view.addGestureRecognizer(tapGesture())
        pullUPView.addGestureRecognizer(swipeGesture())
        return view
    }
    func tapGesture() -> UITapGestureRecognizer{
        let tap = UITapGestureRecognizer(target: self, action: #selector(showInfo))
        
        return tap
    }
    func swipeGesture() -> UISwipeGestureRecognizer{
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(showInfo))
        swipe.direction = .up
        return swipe
    }
    @objc func showInfo(){
        self.pullUpviewHeight.constant = CGFloat(screenSizee / 2)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            OperationQueue.main.addOperation {
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.isScrollEnabled = true
                self.tableView.reloadData()
            }
            
        }
    }
}
extension MapViewController: CLLocationManagerDelegate{
    func configureLocationServices(){
        if authorizationStatus == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        } else {
            return
        }
    }
    
    
}
extension MapViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! MapCell
        
        let loaction = locations[indexPath.row]
        cell.backgroundColor = .clear
        
        cell.adresTextLabel.text = loaction.address
        
        cell.shopsImageView.image = imageArray[indexPath.row]
        cell.selectionStyle = .none
        
        print(coordinates.count)
        
        return cell
    }
}
