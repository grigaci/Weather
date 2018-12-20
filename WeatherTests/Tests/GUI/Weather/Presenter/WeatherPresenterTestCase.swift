//
//  WeatherPresenterTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
@testable import Weather

final class WeatherPresenterTestCase: XCTestCase {

    private var sut: WeatherPresenter!
    private var weatherService: WeatherServiceMock!
    private var view: WeatherViewMock!
    
    override func setUp() {
        weatherService = WeatherServiceMock()
        let location = LocationCoordinatesEntity.random()
        view = WeatherViewMock()
        
        sut = WeatherPresenter(location: location, weatherService: weatherService)
    }

    // MARK: - Test load method
    func test_load_loading() {
        // Given
        var receivedModel: WeatherPresentationModel?
        view.displayImpl = { (model) in
            receivedModel = model
        }
        
        // When
        sut.load(view: view)
        
        // Then
        XCTAssertEqual(receivedModel, .loading)
    }
    
    // MARK: - Test refetchData method
    func test_refetchData_success() {
        // Given
        var receivedModel: WeatherPresentationModel?
        view.displayImpl = { (model) in
            receivedModel = model
        }
        weatherService.simulateSuccessfulResponse()
        
        // When
        sut.load(view: view)
        sut.refetchData()
        
        // Then
        XCTAssertNotNil(receivedModel?.content)
    }
    
    func test_refetchData_error() {
        // Given
        var receivedModel: WeatherPresentationModel?
        view.displayImpl = { (model) in
            receivedModel = model
        }
        weatherService.simulateFailedResponse()
        
        // When
        sut.load(view: view)
        sut.refetchData()
        
        // Then
        XCTAssertNotNil(receivedModel?.error)
    }
}
