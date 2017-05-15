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
    
    let vc: ViewController! = nil
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
    
}
