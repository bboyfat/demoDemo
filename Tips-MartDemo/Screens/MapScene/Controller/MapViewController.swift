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

enum CellType{
    case detailCell
    case allCells
}



class MapViewController: UIViewController, UIGestureRecognizerDelegate {
    
   
    @IBOutlet var pullUpviewHeight: NSLayoutConstraint!
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var pullUPView: PullUpView!
    
    @IBOutlet weak var tableView: UITableView!
  
    let nib = UINib.init(nibName: "DetailMapCell", bundle: nil)
    
    var cellType: CellType = .allCells
    
    var coordinates: [ShopsCoordinates] = []
    var locations: [Locations] = []
    var imageUrlArray: [String] = []
    var imageArray: [UIImage] = []
    
    let apiManager = MapAPI()
    var regionRadius: Double = 1000
    
    let screenSizee = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(nib, forCellReuseIdentifier: "detailMapCell")
        
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
    
    
    @IBAction func categoriesBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "CategoriesMain", bundle: nil).instantiateViewController(withIdentifier: "categoriesController") as! MainCategoriesController
        vc.categoriesFor = .map
        present(vc, animated: true, completion: nil)
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
        let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "tipsShop")
//        view.animatesDrop = true
        view.image = #imageLiteral(resourceName: "Pin")
        
//        view.pinTintColor = .purple
        view.backgroundColor = .clear
        view.canShowCallout = false
        view.addGestureRecognizer(tapGesture())
        pullUPView.addGestureRecognizer(swipeGesture())
        return view
    }
    func tapGesture() -> UITapGestureRecognizer{
        let tap = UITapGestureRecognizer(target: self, action: #selector(showDetails))
        
        return tap
    }
    func swipeGesture() -> UISwipeGestureRecognizer{
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(showInfo))
        swipe.direction = .up
        return swipe
    }
    @objc func showInfo(){
        self.pullUpviewHeight.constant = CGFloat(screenSizee / 2)
        self.cellType = .allCells
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
    @objc func showDetails(){
        self.pullUpviewHeight.constant = CGFloat(screenSizee / 3)
        self.cellType = .detailCell
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
        switch cellType {
        case .allCells:
            return imageArray.count
        case .detailCell:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "detailMapCell", for: indexPath) as! DetailMapCell
        let mapCell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! MapCell
        
        let loaction = locations[indexPath.row]
        mapCell.adresTextLabel.text = loaction.address
        mapCell.shopsImageView.image = imageArray[indexPath.row]
       
//        detailCell.detaliImageView.image = imageArray[0]
//        detailCell.addressLbl.text = "Аддрес:" + " " + locations[0].address
//        detailCell.phoneNumberLbl.text = "Номер телефона:" + " " + locations[0].phoneNumber
        
        mapCell.backgroundColor = .clear
        detailCell.backgroundColor = .clear
        detailCell.selectionStyle = .none
        mapCell.selectionStyle = .none
        
        switch cellType{
        case .detailCell: return detailCell
        case .allCells: return mapCell
        }
        
       
    }
    
    
}
