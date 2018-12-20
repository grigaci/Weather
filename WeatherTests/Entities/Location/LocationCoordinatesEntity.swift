//
//  LocationCoordinatesEntity.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

extension LocationCoordinatesEntity {
    static func random() -> LocationCoordinatesEntity {
        let latitude = Double.random(in: -90...90)
        let longitude = Double.random(in: -180...180)
        return LocationCoordinatesEntity(latitude: latitude, longitude: longitude)
    }
}
