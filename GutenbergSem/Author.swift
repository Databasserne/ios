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
    
    init(dict: Dictionary<String, Any>) {
        if let authorName = dict["Name"] as? String {
            name = authorName
        }
    }
}
