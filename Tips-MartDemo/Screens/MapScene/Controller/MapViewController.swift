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

protocol MapProtocol {
    var coordinates: [ShopsCoordinates] {get set}
    
    var imageUrlArray: [String] {get set}
    var imageArray: [UIImage] {get set}
}

class MapViewController: UIViewController, UIGestureRecognizerDelegate, MapProtocol {
    
    @IBOutlet var pullUpviewHeight: NSLayoutConstraint!
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var pullUPView: PullUpView!
    
    var tableView: UITableView?
    
    var coordinates: [ShopsCoordinates] = []
    var locations: [Locations] = []
    var imageUrlArray: [String] = []
    var imageArray: [UIImage] = []
    
    var regionRadius: Double = 1000
    
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    override func viewDidLoad() {
        super.viewDidLoad()
        MapAPI().mapController = self
        
        MapAPI().getLocation(controller: self) { (finished) in
            if finished{
              
//                self.coordinates = MapAPI().coordinates
                self.addLocations()
                MapAPI().getImages(handler: { (finished) in
                    if finished{
                        
                        self.pullUPView.addSubview(self.tableView!)
                        self.tableView?.reloadData()
                        self.addSwipe()
                        print(finished)
                    }
                })
            }
        }
        
        tableView = UITableView()
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.isScrollEnabled = false
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "mapCell")
        
//        getShops { (finish) in
//            if finish{
//
//                self.getImages(handler: { (finished) in
//                    if finished{
        
//                    }
//                })
//            }
//        }
        
        centerMapOnUserLocation()
        mapView.showsUserLocation = true
        locationManager.delegate = self
        mapView.delegate = self
        getAccess()
        locationUpdate()
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
    
    func getShops(handler: @escaping (_ status: Bool) -> ()){
        Alamofire.request(shopsLocationUrl, method: .get).responseData { (dataResponse) in
            guard let data = dataResponse.data else {return}
            let result = try! JSONDecoder().decode([ShopsCoordinates].self, from: data)
            print(result)
            self.coordinates = result
            self.coordinates.forEach({ (coordinate) in
                coordinate.locations.forEach({ (path) in
                    self.imageUrlArray.append(path.pathImage)
                })
            })
            print(self.coordinates.count)
            print(self.coordinates)
            handler(true)
        }
    }
    
    func getImages(handler: @escaping (_ status: Bool) -> ()){
        imageUrlArray.forEach { (url) in
            Alamofire.request(url).responseImage(completionHandler: { (imageResponse) in
                guard let image = imageResponse.result.value else {return}
                self.imageArray.append(image)
                handler(true)
            })
        }
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
        return view
    }
    
    func tapGesture() -> UITapGestureRecognizer{
        let tap = UITapGestureRecognizer(target: self, action: #selector(showInfo))
        return tap
    }
    @objc func showInfo(){
        self.pullUpviewHeight.constant = 500
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.tableView?.frame = self.pullUPView.bounds
        }
    }
}
extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("  kkk")
    }
    
}


extension MapViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return coordinates.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath)
        
        let loaction = locations[indexPath.row]
        
        cell.textLabel?.text = loaction.address
        cell.imageView?.clipsToBounds = true
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.image = imageArray[indexPath.row]
        
        print(coordinates.count)
        
        return cell
    }
}
