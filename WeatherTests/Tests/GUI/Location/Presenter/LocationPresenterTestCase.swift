//
//  LocationPresenterTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
@testable import Weather

final class LocationPresenterTestCase: XCTestCase {

    private var sut: LocationPresenter!
    private var view: LocationViewMock!
    private var coordinator: LocationCoordinator!
    private var navigationController: UINavigationController!
    private var weatherService: WeatherServiceMock!

    override func setUp() {
        view = LocationViewMock()
        navigationController = UINavigationController()
        weatherService = WeatherServiceMock()
        coordinator = LocationCoordinator(navigationController: navigationController, weatherService: weatherService)
        sut = LocationPresenter(coordinator: coordinator)
        sut.load(view: view)
    }

    // MARK: - Test load method
    func test_load_defaultValues() {
        // Given
        var receivedModel: LocationPresentationModel?
        view.displayPresentationModelImpl = { (model) in
            receivedModel = model
        }

        // When
        sut = LocationPresenter(coordinator: coordinator)
        sut.load(view: view)

        // Then
        XCTAssertNotNil(receivedModel)
    }
    
    // MARK: - Test update method
    func test_update_valid() {
        // Given
        let validModel = LocationPresentationModel.random()
        var receivedModel: LocationPresentationModel?
        view.displayPresentationModelImpl = { (model) in
            receivedModel = model
        }
        
        // When
        sut.update(latitude: validModel.latitude, longitude: validModel.longitude)
        
        // Then
        XCTAssertNotNil(receivedModel)
    }
    
    func test_update_invalid() {
        // Given
        var receivedModel: LocationPresentationModel?
        var receivedErrorModel: LocationErrorPresentationModel?
        view.displayPresentationModelImpl = { (model) in
            receivedModel = model
        }
        view.displayErrorPresentationModelImpl = { (model) in
            receivedErrorModel = model
        }
        
        // When
        sut.update(latitude: "a", longitude: "b")
        
        // Then
        XCTAssertNil(receivedModel)
        XCTAssertNotNil(receivedErrorModel)
    }
    
    // MARK: - Test seeWeather method
    func test_seeWeather_valid() {
        // Given
        let validModel = LocationPresentationModel.random()
        
        // When
        sut.seeWeather(latitude: validModel.latitude, longitude: validModel.longitude)
        // Then
        XCTAssertTrue(navigationController.viewControllers.count > 0)
    }
    
    func test_seeWeather_invalid() {
        // Given
        var receivedErrorModel: LocationErrorPresentationModel?
        view.displayErrorPresentationModelImpl = { (model) in
            receivedErrorModel = model
        }

        // When
        sut.update(latitude: ";", longitude: "-1000")

        // Then
        XCTAssertTrue(navigationController.viewControllers.count == 0)
        XCTAssertNotNil(receivedErrorModel)
    }

}
