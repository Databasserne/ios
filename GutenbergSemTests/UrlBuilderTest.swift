//
//  UrlBuilderTest.swift
//  GutenbergSem
//
//  Created by Alexander Steen on 24/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import XCTest

@testable import GutenbergSem
class UrlBuilderTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        DatabaseToUse = .MySql
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchByCity() {
        let expected = "\(Urlbuilder.BASE_URL)/mysql/city/Florence"
        let url = Urlbuilder.searchByCityUrl(city: "Florence")
        
        let json = ""
        XCTAssertTrue(json == "")
    }
    
}
