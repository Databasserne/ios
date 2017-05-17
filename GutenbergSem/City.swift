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
    
    
    var Name: String {
        return name
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(dict: Dictionary<String, Any>) {
        if let cityName = dict["Name"] as? String {
            name = cityName
        }
    }
}
