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
/// It only fetches the data over the network.
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
        // TODO: Store this in an environment.
        var urlString = "https://api.openweathermap.org/data/2.5/weather?"
        urlString += "lat=" + formatCoordinate(location.latitude)
        urlString += "&lon=" + formatCoordinate(location.longitude)
        urlString += "&APPID=e50a49920410cbca45f40b816019ea2d"
        urlString += "&units=metric"
        
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        networkLayer.send(urlRequest: urlRequest) { [weak self] (response) in
            self?.handle(response, completionHandler: completionHandler)
        }
    }
    
    private func handle(_ networkResponse: NetworkServiceResponse<Data>, completionHandler: @escaping CompletionHandler) {
        operatingQueue.async {
            switch networkResponse {
            case .error(_):
                // TODO: Handle error cases
                self.notify(completionHandler, with: .error)
            case .success(let data):
                self.handle(data, completionHandler: completionHandler)
            }
        }
    }
    
    private func handle(_ data: Data, completionHandler: @escaping CompletionHandler) {
        operatingQueue.async {
            guard let dto = try? JSONDecoder().decode(OpenWeatherMapRootDTO.self, from: data) else {
                self.notify(completionHandler, with: .error)
                return
            }
            let entity = WeatherEntity(dto)
            self.notify(completionHandler, with: .success(entity))
        }
    }
    
    private func notify(_ completionHandler: @escaping CompletionHandler,
                        with response: WeatherServiceResult) {
        completionQueue.async {
            completionHandler(response)
        }
    }
    
    private func formatCoordinate(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 5
        return numberFormatter.string(from: value as NSNumber)!
    }
}

extension WeatherService: WeatherServiceProtocol {}

extension WeatherEntity {
    fileprivate init(_ dto: OpenWeatherMapRootDTO) {
        self.init()
        // TODO: This should be moved to a factory
        mainDescription = dto.details.first?.main ?? ""
        temperature = dto.main.temperature
        humidity = dto.main.humidity
        minTemperature = dto.main.minTemperature
        maxTemperature = dto.main.maxTemperature
    }
}
