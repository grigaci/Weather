//
//  OpenWeatherMapMainDTO.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Part of the JSON model received from OpenWeatherMap
struct OpenWeatherMapMainDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case humidity = "humidity"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
    }
    
    let temperature: Double
    let humidity: Double
    let minTemperature: Double
    let maxTemperature: Double
}
