//
//  GutenbergSemTests.swift
//  GutenbergSemTests
//
//  Created by Alexander Steen on 10/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import XCTest

@testable import GutenbergSem
class GutenbergSemTests: XCTestCase {
    
    let vc: SearchVC! = nil
    var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    override func tearDown() {
        sessionUnderTest = nil
        super.tearDown()
    }
    
    func testCallToApiCompletes() {

        let url = URL(string: "https://www.cphbusiness.dk")

        
        
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
    func testSearchCity() {
        
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchCityUrl(){
        let city = "Florence"
        let expected = "\(Urlbuilder.BASE_URL)/mysql/city/\(city)"
        
        let url = Urlbuilder.searchByCityUrl(city: city)
        
        XCTAssertEqual(expected, url.absoluteString)
    }
    
    func testSearchAuthorUrl(){
        let author = "William"
        let expected = "\(Urlbuilder.BASE_URL)/mysql/author/\(author)"
        
        let url = Urlbuilder.searchByAuthorUrl(author: author)
        
        XCTAssertEqual(expected, url.absoluteString)
    }
    
    func testSearchBookUrl(){
        let book = "stuff"
        let expected = "\(Urlbuilder.BASE_URL)/mysql/book/\(book)"
        
        let url = Urlbuilder.searchByBookUrl(book: book)
        
        XCTAssertEqual(expected, url.absoluteString)
    }
    
    func testSearchGeolocationUrl(){
        let lat = "40.023"
        let lng = "-23.400"
        let expected = "\(Urlbuilder.BASE_URL)/mysql/location/\(lat)/\(lng)"
        
        let url = Urlbuilder.searchByGeolocation(lat: lat, lng: lng)
        
        XCTAssertEqual(expected, url.absoluteString)
    }
    
}
