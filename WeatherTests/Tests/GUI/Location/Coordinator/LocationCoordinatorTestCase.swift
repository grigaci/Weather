//
//  LocationCoordinatorTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
@testable import Weather

final class LocationCoordinatorTestCase: XCTestCase {

    private var sut: LocationCoordinator!
    private var navigationController: UINavigationController!
    private var weatherService: WeatherServiceMock!
    
    
    override func setUp() {
        navigationController = UINavigationController()
        weatherService = WeatherServiceMock()
        sut = LocationCoordinator(navigationController: navigationController, weatherService: weatherService)
    }
    
    // MARK: - Test showWeather method
    func test_showWeather() {
        // When
        sut.showWeather(at: LocationCoordinatesEntity.random())
        
        // Then
        XCTAssertTrue(navigationController.viewControllers.count > 0)
    }
}
