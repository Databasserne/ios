//
//  City.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 17/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import Foundation

class City {
    private var name: String!
    private var lat: Float!
    private var lng: Float!
    
    var Name: String {
        return name
    }
    
    var Lat: Float {
        return lat
    }
    
    var Lng: Float {
        return lng
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(dict: Dictionary<String, Any>) {
        if let cityName = dict["name"] as? String {
            name = cityName
        }
        if let geolat = dict["geolat"] as? Float {
            lat = geolat
        }
        if let geolng = dict["geolng"] as? Float {
            lng = geolng
        }
    }
}
