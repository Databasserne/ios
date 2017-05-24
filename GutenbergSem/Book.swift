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
    private var auth: Author!
    
    var Name: String {
        return name
    }
    
    var Auth: Author {
        if auth == nil {
            auth = Author(name: "")
        }
        return auth
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(dict: Dictionary<String, Any>) {
        if let bookName = dict["name"] as? String {
            name = bookName
        }
        if let authorDict = dict["author"] as? Dictionary<String, String> {
            auth = Author(dict: authorDict)
        }
    }
}
