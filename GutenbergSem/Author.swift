//
//  Author.swift
//  GutenbergSem
//
//  Created by Jonas Simonsen on 17/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import Foundation

class Author {
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
        if let authName = dict["name"] as? String {
            name = authName
        }
        if let geolat = dict["geolat"] as? Float {
            lat = geolat
        }
        if let geolng = dict["geolng"] as? Float {
            lng = geolng
        }
    }
}

