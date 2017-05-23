//
//  Urlbuilder.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 22/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import Foundation

class Urlbuilder {
    static let BASE_URL = "https://bdea7eae.ngrok.io/web/api";
    
    static func searchByCityMySqlUrl(city: String) -> URL {
        return URL(string: "\(BASE_URL)/mysql/city/\(city)")!
    }
    
    static func searchByAuthorMySqlUrl(author: String) -> URL {
        return URL(string: "\(BASE_URL)/mysql/author/\(author)")!
    }
    
    static func searchByBookMySqlUrl(book: String) -> URL {
        return URL(string: "\(BASE_URL)/mysql/book/\(book)")!
    }
    
}
