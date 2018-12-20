//
//  OpenWeatherMapRootDTO.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

extension OpenWeatherMapRootDTO {
    static func random() -> OpenWeatherMapRootDTO {
        return OpenWeatherMapRootDTO(
            details: [OpenWeatherMapDetailsDTO.random()],
            main: OpenWeatherMapMainDTO.random()
        )
    }
}
