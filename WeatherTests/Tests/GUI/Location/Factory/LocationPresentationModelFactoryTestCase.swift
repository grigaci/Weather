//
//  LocationPresentationModelFactoryTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
@testable import Weather

final class LocationPresentationModelFactoryTestCase: XCTestCase {

    private var sut: LocationPresentationModelFactory!
    
    override func setUp() {
        sut = LocationPresentationModelFactory()
    }

    // MARK: - Test createPresentationModel method
    func test_createPresentationModel_valid() {
        // Given
        let latitude = String(LatitudeRange.minValue)
        let longitude = String(LongitudeRange.minValue)
        
        // When
        let result = sut.createPresentationModel(latitude: latitude, longitude: longitude)
        
        // Then
        XCTAssertNotNil(result.content)
    }
    
    func test_createPresentationModel_invalid_latitude() {
        // Given
        let latitude = String(LatitudeRange.minValue - 10)
        let longitude = String(LongitudeRange.minValue)
        
        // When
        let result = sut.createPresentationModel(latitude: latitude, longitude: longitude)
        
        // Then
        XCTAssertNotNil(result.error)
    }
    
    func test_createPresentationModel_invalid_longitude() {
        // Given
        let latitude = String(LatitudeRange.minValue)
        let longitude = String(LongitudeRange.maxValue + 1)

        // When
        let result = sut.createPresentationModel(latitude: latitude, longitude: longitude)
        
        // Then
        XCTAssertNotNil(result.error)
    }
}
