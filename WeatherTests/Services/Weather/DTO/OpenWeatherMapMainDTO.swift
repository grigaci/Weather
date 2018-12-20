//
//  OpenWeatherMapMainDTO.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

extension OpenWeatherMapMainDTO {
    static func random() -> OpenWeatherMapMainDTO {
        let humidity = Double.random(in: 0...100)
        let minTemperature = Double.random(in: 0..<10)
        let maxTemperature = Double.random(in: 11..<30)
        let temperature = Double.random(in: minTemperature...maxTemperature)
        
        return OpenWeatherMapMainDTO(temperature: temperature,
                                     humidity: humidity,
                                     minTemperature: minTemperature,
                                     maxTemperature: maxTemperature)
    }
}
