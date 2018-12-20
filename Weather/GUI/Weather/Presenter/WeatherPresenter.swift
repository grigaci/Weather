//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Presenter for the Weather screen.
final class WeatherPresenter {
    
    /// Service responsible for fetching the wheater over network
    private let weatherService: WeatherServiceProtocol

    /// Location for where to show weather.
    private let location: LocationCoordinatesEntity
    
    /// Coverts entity(domain model) to presentation model
    private let factory = WeatherPresentationModelFactory()
    
    private weak var view: WeatherView?

    init(location: LocationCoordinatesEntity,
         weatherService: WeatherServiceProtocol) {
        self.location = location
        self.weatherService = weatherService
    }
    
    // Populate the view with initial data.
    func load(view: WeatherView) {
        self.view = view
        
        refetchData()
    }
    
    // Refetch data from service and update the view.
    func refetchData() {
        // Show loading
        view?.display(presentationModel: .loading)
        
        // Kick off service fetch
        weatherService.fetch(from: location) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .error:
                self.view?.display(presentationModel: .error(WeatherErrorPresentationModel()))
            case .success(let entity):
                let presentationModel = self.factory.createPresentationModel(from: entity)
                self.view?.display(presentationModel: presentationModel)
            }
        }
    }
}
