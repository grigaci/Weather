//
//  WeatherEntity.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Domain model containing weather information.
struct WeatherEntity {
    /// General description of the weather.
    var mainDescription = ""
    /// Current temperature in °C.
    var temperature: Double = 0
    /// Current humidity.
    var humidity: Double = 0
    /// Today's min temperature in °C.
    var minTemperature: Double = 0
    /// Today's max temperature in °C.
    var maxTemperature: Double = 0
}
