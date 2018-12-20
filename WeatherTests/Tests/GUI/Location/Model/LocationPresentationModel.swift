//
//  LocationPresentationModel.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

extension LocationPresentationModel {
    
    static func random() -> LocationPresentationModel {
        var model = LocationPresentationModel()
        model.latitude = String(LocationPresentationModelFactory.defaultPresentationModel.latitude)
        model.longitude = String(LocationPresentationModelFactory.defaultPresentationModel.longitude)
        return model
    }
}
