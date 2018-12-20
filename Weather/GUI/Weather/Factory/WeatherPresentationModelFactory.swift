//
//  WeatherPresentationModelFactory.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

final class WeatherPresentationModelFactory {
    
    func createPresentationModel(from entity: WeatherEntity) -> WeatherPresentationModel {
        var contentPresentationModel = WeatherContentPresentationModel()
        
        // TODO: This conversion should be done by a service.
        contentPresentationModel.temperatureText = String(Int(entity.temperature)) + " °C"
        contentPresentationModel.minTemperature = String(Int(entity.minTemperature)) + " °C"
        contentPresentationModel.maxTemperature = String(Int(entity.maxTemperature)) + " °C"
        contentPresentationModel.humidityText = String(Int(entity.humidity))
        contentPresentationModel.descriptionText = entity.mainDescription

        return .content(contentPresentationModel)
    }
}
