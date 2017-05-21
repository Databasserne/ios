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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let locations = [
            ["title": "New York, NY",    "latitude": 40.713054, "longitude": -74.007228],
            ["title": "Los Angeles, CA", "latitude": 34.052238, "longitude": -118.243344],
            ["title": "Chicago, IL",     "latitude": 41.883229, "longitude": -87.632398],
            ["title": "København", "latitude": 55.684932, "longitude": 12.556713]
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["title"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            mapView.addAnnotation(annotation)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

