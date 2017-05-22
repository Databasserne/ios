//
//  Urlbuilder.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 22/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import Foundation

class Urlbuilder {
    static let BASE_URL = "https://945b6d4a.ngrok.io/web/api";
    
    static func searchByCityMySqlUrl(city: String) -> URL {
        return URL(string: "\(BASE_URL)/mysql/city/\(city)")!
    }
    
    static func searchByBookMySqlUrl(book: String) -> URL {
        return URL(string: "\(BASE_URL)/mysql/book/\(book)")!
    }
    
}
