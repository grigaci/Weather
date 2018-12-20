//
//  WeatherService.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Interface for weather service.
protocol WeatherServiceProtocol: class {
    typealias CompletionHandler = (WeatherServiceResult) -> Void
    
    /// Fetch weather data based on a location.
    ///
    /// - Parameter location: Desired location.
    /// - Parameter completionHandler: Closure to be called with the result.
    func fetch(from location: LocationCoordinatesEntity, completionHandler: @escaping CompletionHandler)
}

/// Implementation for the weather service.
///
/// it only fetches the data over the network.
final class WeatherService {
    
    // Queue on which to run the service
    var operatingQueue = DispatchQueue.global()
    
    // Queue on which to run the callbacks
    var completionQueue = DispatchQueue.main
    
    private let networkLayer: NetworkServiceProtocol!
    
    init(networkLayer: NetworkServiceProtocol) {
        self.networkLayer = networkLayer
    }
    
    func fetch(from location: LocationCoordinatesEntity, completionHandler: @escaping CompletionHandler) {
        
    }
    
}

extension WeatherService: WeatherServiceProtocol {}
