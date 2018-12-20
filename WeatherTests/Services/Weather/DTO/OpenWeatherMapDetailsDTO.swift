//
//  OpenWeatherMapDetailsDTO.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

extension OpenWeatherMapDetailsDTO {
    static func random() -> OpenWeatherMapDetailsDTO {
        return OpenWeatherMapDetailsDTO(main: "Mocked data")
    }
}
