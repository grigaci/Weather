//
//  OpenWeatherMapRootDTO.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Root object part of the JSON received from OpenWethearMap.
struct OpenWeatherMapRootDTO: Codable {
    
    enum CodingKeys: String, CodingKey {
        case details = "weather"
        case main = "main"
    }
    
    let details: [OpenWeatherMapDetailsDTO]
    let main: OpenWeatherMapMainDTO
}
