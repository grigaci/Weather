//
//  LocationPresentationModelFactory.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Create presentation models for Location screen.
final class LocationPresentationModelFactory {
    
    /// Value to be shown on app start up.
    class var defaultPresentationModel: LocationPresentationModel {
        get {
            var model = LocationPresentationModel()
            // Brussels, Belgium
            model.latitude = "50.85045"
            model.longitude = "4.34878"
            return model
        }
    }
    
    /// Create a presentation model based on given latitude and longitude.
    ///
    /// - Parameter latitude: Given latitude.
    /// - Parameter latitude: Given longitude.
    /// - Returns: A valid presentation model or error in case of invalid given data.
    func createPresentationModel(latitude: String, longitude: String) -> LocationValidationResult {
        guard let latitudeNumber = Double(latitude), LatitudeRange.isValid(latitudeNumber) == true else {
            return .error(createLatitudeErrorPresentationModel())
        }
        
        guard let longitudeNumber = Double(longitude), LongitudeRange.isValid(longitudeNumber) == true else {
            return .error(createLongitudeErrorPresentationModel())
        }
        
        var presentationModel = LocationPresentationModel()
        presentationModel.latitude = String(latitudeNumber)
        presentationModel.longitude = String(longitudeNumber)
        return .success(presentationModel)
    }
    
    private func createLatitudeErrorPresentationModel() -> LocationErrorPresentationModel {
        var presentationModel = LocationErrorPresentationModel()
        presentationModel.message = NSLocalizedString("Invalid latitude. It should be a decimal value between \(Int(LatitudeRange.minValue)) and \(Int(LatitudeRange.maxValue)).", comment: "")
        return presentationModel
    }
    
    private func createLongitudeErrorPresentationModel() -> LocationErrorPresentationModel {
        var presentationModel = LocationErrorPresentationModel()
        presentationModel.message = NSLocalizedString("Invalid longitude. It should be a decimal value between -180 and +180.", comment: "")
        return presentationModel
    }
}

/// Wraps the result of a coordinate validation.
enum LocationValidationResult {
    case success(LocationPresentationModel)
    case error(LocationErrorPresentationModel)
    
    var content: LocationPresentationModel? {
        guard case .success(let model) = self else {return nil}
        return model
    }
    
    var error: LocationErrorPresentationModel? {
        guard case .error(let model) = self else {return nil}
        return model
    }
}

/// Range for latitude.
enum LatitudeRange {
    static var minValue: Double = -90
    static var maxValue: Double = 90
    
    /// Check is a given latitude is valid
    static func isValid(_ value: Double) -> Bool {
        return value >= LatitudeRange.minValue && value <= LatitudeRange.maxValue
    }
}

/// Range for longitude.
enum LongitudeRange {
    static var minValue: Double = -180
    static var maxValue: Double = 180
    
    /// Check is a given longitude is valid
    static func isValid(_ value: Double) -> Bool {
        return value >= LongitudeRange.minValue && value <= LongitudeRange.maxValue
    }
}

