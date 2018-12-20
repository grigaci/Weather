//
//  LocationTestCase.swift
//  WeatherUITests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest

enum LocationScreenIdentifiers:String{
    case latitudeField = "latitude_text_field"
    case longitudeField = "longitude_text_field"
    case seeWeatherButton = "see_weather_button"
}

final class LocationTestCase: XCTestCase {
    private let app = XCUIApplication()
    private let latitudeField = XCUIApplication().textFields[LocationScreenIdentifiers.latitudeField.rawValue]
    private let longitudeField = XCUIApplication().textFields[LocationScreenIdentifiers.longitudeField.rawValue]
    private let seeWeatherButton = XCUIApplication().buttons[LocationScreenIdentifiers.seeWeatherButton.rawValue]
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func test_checkAboveLowerLatitudeLimit() {
        emptyTextField(latitudeField)
        latitudeField.typeText("-91")
        seeWeatherButton.tap()
        XCTAssertTrue(app.alerts.firstMatch.exists)
    }
    
    func test_checkAboveUpperLatitudeLimit(){
        emptyTextField(latitudeField)
        latitudeField.typeText("91")
        seeWeatherButton.tap()
        XCTAssertTrue(app.alerts.firstMatch.exists)
    }
    
    func test_checkLowerLatitudeLimit(){
        emptyTextField(latitudeField)
        latitudeField.typeText("-90")
        seeWeatherButton.tap()
        XCTAssertFalse(app.alerts.firstMatch.exists)
    }
    
    func test_checkUpperLatitudeLimit(){
        emptyTextField(latitudeField)
        latitudeField.typeText("90")
        seeWeatherButton.tap()
        XCTAssertFalse(app.alerts.firstMatch.exists)
    }
    
    func test_checkAboveLowerLongitudeLimit(){
        emptyTextField(longitudeField)
        longitudeField.typeText("-181")
        seeWeatherButton.tap()
        XCTAssertTrue(app.alerts.firstMatch.exists)
    }
    
    func test_checkAboveUpperLongitudeLimit(){
        emptyTextField(longitudeField)
        longitudeField.typeText("181")
        seeWeatherButton.tap()
        XCTAssertTrue(app.alerts.firstMatch.exists)
    }
    
    func test_checkLowerLongitudeLimit(){
        emptyTextField(longitudeField)
        longitudeField.typeText("-180")
        seeWeatherButton.tap()
        XCTAssertFalse(app.alerts.firstMatch.exists)
    }
    
    func test_checkUpperLongitudeLimi(){
        emptyTextField(longitudeField)
        longitudeField.typeText("180")
        seeWeatherButton.tap()
        XCTAssertFalse(app.alerts.firstMatch.exists)
    }
    
    func emptyTextField(_ field: XCUIElement){
        field.tap()
        while (field.value as! String).count > 0 {
            app.keys["delete"].tap()
        }
    }
}
