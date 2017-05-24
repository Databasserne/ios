//
//  GutenbergSemUITests.swift
//  GutenbergSemUITests
//
//  Created by Alexander Steen on 10/05/2017.
//  Copyright © 2017 Databasserne. All rights reserved.
//

import XCTest

@testable import GutenbergSem
class GutenbergSemUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAuther() {
        let app = XCUIApplication()
        app.buttons["Auther"].tap()
        
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("Shakespeare, William")
        app.buttons["Søg"].tap()
        
        sleep(5)
        
        let cells = XCUIApplication().tables.cells
        XCTAssertGreaterThan(cells.count, 0)
    }
    
    func testBooks() {
        let app = XCUIApplication()
        app.buttons["Book"].tap()
        let searchSearchField = app.searchFields["Search"]
        
        searchSearchField.tap()
        searchSearchField.typeText("La Fiammetta")
        app.buttons["Søg"].tap()
        
        app.buttons["Close"].tap()
    }
    
    func testCity() {
        let app = XCUIApplication()
        app.buttons["City"].tap()
        
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("Florence")
        app.buttons["Søg"].tap()
        
        sleep(5)
        
        let cells = XCUIApplication().tables.cells
        XCTAssertGreaterThan(cells.count, 0)
    }
    
    func testGeolocation() {
        let app = XCUIApplication()
        app.buttons["Geolocation"].tap()
        
        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("37/-122")
        app.buttons["Søg"].tap()
        
        sleep(5)
        
        let cells = XCUIApplication().tables.cells
        XCTAssertGreaterThan(cells.count, 0)
    }
    
    func testNeo4jAuther() {
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Bookmarks"].tap()
        app.switches["0"].tap()
        tabBarsQuery.buttons["Search"].tap()
        
        app.buttons["Auther"].tap()

        let searchSearchField = app.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("Shakespeare, William")
        app.buttons["Søg"].tap()
        
        sleep(5)
        
        let cells = XCUIApplication().tables.cells
        XCTAssertGreaterThan(cells.count, 0)
    }
    
}
