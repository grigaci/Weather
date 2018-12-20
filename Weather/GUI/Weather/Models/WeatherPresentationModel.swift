//
//  WeatherPresentationModel.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Presentation model for the Weather screen.
///
/// Must be one of the available values.
enum WeatherPresentationModel {
    /// Spinner shown during the service fetch operation.
    case loading
    /// Alert shown when request failed.
    case error(WeatherErrorPresentationModel)
    /// Content shown when request succeeds.
    case content(WeatherContentPresentationModel)
    
    var content: WeatherContentPresentationModel? {
        guard case .content(let model) = self else {return nil}
        return model
    }
    
    var error: WeatherErrorPresentationModel? {
        guard case .error(let model) = self else {return nil}
        return model
    }
}

extension WeatherPresentationModel: Equatable {
    static func == (lhs: WeatherPresentationModel, rhs: WeatherPresentationModel) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.error(let lhsError), .error(let rhsError)):
            return lhsError == rhsError
        case (.content(let lhsContent), .content(let rhsContent)):
            return lhsContent == rhsContent
        default:
            return false
        }
    }
}
