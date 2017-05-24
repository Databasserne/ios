//
//  MapVC.swift
//  GutenbergSem
//
//  Created by Jonas Simonsen on 17/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var cities: [City]!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mapView.delegate = self
        
//        let locations = [
//            ["title": "New York, NY",    "latitude": 40.713054, "longitude": -74.007228],
//            ["title": "Los Angeles, CA", "latitude": 34.052238, "longitude": -118.243344],
//            ["title": "Chicago, IL",     "latitude": 41.883229, "longitude": -87.632398],
//            ["title": "København", "latitude": 55.684932, "longitude": 12.556713]
//        ]
        
        for city in cities {
            let annotation = MKPointAnnotation()
            annotation.title = city.Name
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(city.Lat), longitude: CLLocationDegrees(city.Lng))
            mapView.addAnnotation(annotation)
        }
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}

