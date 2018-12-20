//
//  WeatherContentPresentationModel.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Displayed weather info data.
struct WeatherContentPresentationModel {
    var descriptionText = ""
    var temperatureText = ""
    var humidityText = ""
    var minTemperature = ""
    var maxTemperature = ""
}

extension WeatherContentPresentationModel: Equatable {}
