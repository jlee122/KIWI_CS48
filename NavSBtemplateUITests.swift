//
//  NavSBtemplateUITests.swift
//  NavSBtemplateUITests
//
//  Created by Kalyn Klimek on 5/2/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import XCTest

class NavSBtemplateUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScreenTransitionAR() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let mainScreen = app.staticTexts.element(matching: .any, identifier: "NavSBLabel")
        XCTAssertTrue(mainScreen.exists)
//        let ARButton = app.segmentedControls.element(matching: .any, identifier: "NavSBAR")
//        XCTAssertTrue(ARButton.exists)
        
        app.buttons["AR Feature"].tap()
        let ARScreen = app.staticTexts["Augmented Reality"]
        
        XCTAssertTrue(ARScreen.exists)
        
        app.buttons["Go Back"].tap()
        XCTAssertTrue(mainScreen.exists)
//        XCTAssertTrue(ARButton.exists)
    }
    
    func testScreenTransition2DMap() {
        
        let app = XCUIApplication()
        
        let mainScreen = app.staticTexts.element(matching: .any, identifier: "NavSBLabel")
        XCTAssertTrue(mainScreen.exists)
        
        app.buttons["Interactive Map"].tap()
        let TwoDMap = app.staticTexts["Interactive Map"]
        XCTAssertTrue(TwoDMap.exists)
        
        app.buttons["Go Back"].tap()
        XCTAssertTrue(mainScreen.exists)
    }
    
    func testScreenTransitionHelp() {
        let app = XCUIApplication()
        
        let mainScreen = app.staticTexts.element(matching: .any, identifier: "NavSBLabel")
        XCTAssertTrue(mainScreen.exists)
        
        app.buttons["Help & Assistance"].tap()
        let help = app.staticTexts["Help & Assistance"]
        XCTAssertTrue(help.exists)
        
        app.buttons["Go Back"].tap()
        XCTAssertTrue(mainScreen.exists)
    }

}
