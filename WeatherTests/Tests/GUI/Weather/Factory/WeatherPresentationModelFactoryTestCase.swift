//
//  WeatherPresentationModelFactoryTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
@testable import Weather

final class WeatherPresentationModelFactoryTestCase: XCTestCase {

    private var sut: WeatherPresentationModelFactory!
    
    override func setUp() {
        sut = WeatherPresentationModelFactory()
    }

    // MARK: - Test createPresentationModel method
    func test_createPresentationModel() {
        // Given
        let entity = WeatherEntity.random()
        
        // When
        let presentationModel = sut.createPresentationModel(from: entity)

        // Then
        XCTAssertNotNil(presentationModel.content)
    }
}
