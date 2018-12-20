//
//  WeatherEntity.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

extension WeatherEntity {
    static func random() -> WeatherEntity {
        var entity = WeatherEntity()
        entity.mainDescription = "Test data"
        entity.minTemperature = Double.random(in: 0..<10)
        entity.maxTemperature = Double.random(in: 10..<30)
        entity.temperature = Double.random(in: entity.minTemperature..<entity.maxTemperature)
        entity.humidity = Double.random(in: 0..<100)
        return entity
    }
}
