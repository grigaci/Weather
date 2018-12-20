//
//  WeatherErrorPresentationModel.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Error model to show in weather service request fails.
struct WeatherErrorPresentationModel {
    var title = NSLocalizedString("Error", comment: "")
    var message = NSLocalizedString("Could not fetch weather. Please try again later", comment: "")
    var okText = NSLocalizedString("OK", comment: "")
}

extension WeatherErrorPresentationModel: Equatable {}
