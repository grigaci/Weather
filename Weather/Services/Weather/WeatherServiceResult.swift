//
//  WeatherServiceResult.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Possible result values for a request to the weather service.
enum WeatherServiceResult {
    case success(WeatherEntity)
    case error
}
