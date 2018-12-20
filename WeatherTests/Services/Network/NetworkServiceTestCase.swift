//
//  NetworkServiceTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
@testable import Weather

final class NetworkServiceTestCase: XCTestCase {

    private var sut: NetworkService!
    
    override func setUp() {
        sut = NetworkService()
    }

    // MARK: - Test send method
    func test_send_success() {
        // Given
        let async = expectation(description: "Network call")
        let url = URL(string: "https://google.com")!
        let urlRequest = URLRequest(url: url)
        
        // When
        var receivedResponse: NetworkServiceResponse<Data>?
        sut.send(urlRequest: urlRequest) { (response) in
            receivedResponse = response
            async.fulfill()
        }
        
        // Then
        wait(for: [async], timeout: 5)
        XCTAssertNotNil(receivedResponse?.object)
    }
}
