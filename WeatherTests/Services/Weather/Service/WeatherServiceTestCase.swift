//
//  WeatherServiceTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
@testable import Weather

final class WeatherServiceTestCase: XCTestCase {

    private var sut: WeatherService!
    private var networkService: NetworkServiceMock!
    
    override func setUp() {
        networkService = NetworkServiceMock()
        sut = WeatherService(networkLayer: networkService)
    }

    // MARK: - Test fetch method
    func test_fetch_successful() {
        // Given
        let dto = OpenWeatherMapRootDTO.random()
        let data = try! JSONEncoder().encode(dto)
        networkService.simulateSuccessfulResponse(data)
        
        // When
        var receivedResponse: WeatherServiceResult?
        let async = expectation(description: "Thread sync")
        sut.fetch(from: LocationCoordinatesEntity.random()) { (result) in
            receivedResponse = result
            async.fulfill()
        }
        
        // Then
        wait(for: [async], timeout: 2)
        XCTAssertNotNil(receivedResponse?.data)
    }
    
    func test_fetch_failed() {
        // Given
        networkService.simulateFailedResponse(.decodingFailed)
        
        // When
        var receivedResponse: WeatherServiceResult?
        let async = expectation(description: "Thread sync")
        sut.fetch(from: LocationCoordinatesEntity.random()) { (result) in
            receivedResponse = result
            async.fulfill()
        }
        
        // Then
        wait(for: [async], timeout: 2)
        XCTAssertNil(receivedResponse?.data)
    }
}
