//
//  Book.swift
//  GutenbergSem
//
//  Created by Jonas Simonsen on 17/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import Foundation

class Book {
    private var name: String!
    
    var Name: String {
        return name
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(dict: Dictionary<String, Any>) {
        if let bookName = dict["Name"] as? String {
            name = bookName
        }
    }
}
