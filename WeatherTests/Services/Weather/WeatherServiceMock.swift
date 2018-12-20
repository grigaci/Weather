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
    
}

extension WeatherServiceMock: WeatherServiceProtocol {

    func fetch(from location: LocationCoordinatesEntity, completionHandler: @escaping CompletionHandler) {
        
    }
}
