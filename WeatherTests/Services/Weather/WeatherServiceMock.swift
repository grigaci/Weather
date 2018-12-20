//
//  WeatherServiceMock.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

final class WeatherServiceMock {
    var fetchResponse: WeatherServiceResult?
    
    func simulateSuccessfulResponse() {
        let entity = WeatherEntity.random()
        fetchResponse = WeatherServiceResult.success(entity)
    }
    
    func simulateFailedResponse() {
        fetchResponse = WeatherServiceResult.error
    }
}

extension WeatherServiceMock: WeatherServiceProtocol {
    func fetch(from location: LocationCoordinatesEntity, completionHandler: @escaping CompletionHandler) {
        guard let fetchResponse = fetchResponse else {return}
        completionHandler(fetchResponse)
    }
}
