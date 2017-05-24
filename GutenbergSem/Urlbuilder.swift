//
//  Urlbuilder.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 22/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import Foundation

class Urlbuilder {
    static let BASE_URL = "https://befaf975.ngrok.io/web/api";
    
    static func searchByCityUrl(city: String) -> URL {
        let escapedString = city.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        return URL(string: "\(BASE_URL)/\(getDbType())/city/\(escapedString!)")!
    }
    
    static func searchByAuthorUrl(author: String) -> URL {
        let escapedString = author.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        return URL(string: "\(BASE_URL)/\(getDbType())/author/\(escapedString!)")!
    }
    
    static func searchByBookUrl(book: String) -> URL {
        let escapedString = book.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        return URL(string: "\(BASE_URL)/\(getDbType())/book/\(escapedString!)")!
    }
    
    static func searchByGeolocation(lat: String, lng: String) -> URL{
        return URL(string: "\(BASE_URL)/\(getDbType())/location/\(lat)/\(lng)")!
    }
    
    private static func getDbType() -> String {
        switch DatabaseToUse {
        case .MySql:
            return "mysql"
        case .Neo4j:
            return "neo4j"
        }
    }
}
