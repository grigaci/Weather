//
//  WeatherTestCase.swift
//  WeatherUITests
//
//  Created by Bogdan Iusco on 12/21/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest

enum WeatherScreenIdentifiers: String {
    case description = "weather_description"
    case currentTemp = "current_temperature"
    case minTemp = "min_temperature"
    case maxTemp = "max_temperature"
    case backButton = "Location"
}

final class WeatherTestCase: XCTestCase {
    
    private let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
    }
    
    func test_checkWeatherData() {
        app.buttons[LocationScreenIdentifiers.seeWeatherButton.rawValue].tap()
        let _ = app.buttons[WeatherScreenIdentifiers.backButton.rawValue].waitForExistence(timeout: 5)
        XCTAssertTrue(app.staticTexts[WeatherScreenIdentifiers.description.rawValue].exists)
        XCTAssertTrue(app.staticTexts[WeatherScreenIdentifiers.currentTemp.rawValue].exists)
        XCTAssertTrue(app.staticTexts[WeatherScreenIdentifiers.minTemp.rawValue].exists)
        XCTAssertTrue(app.staticTexts[WeatherScreenIdentifiers.maxTemp.rawValue].exists)
    }
}
