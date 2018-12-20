//
//  LocationPresenter.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Presenter for the Location screen.
final class LocationPresenter {
    private let coordinator: LocationCoordinator
    private weak var view: LocationView?
    private let factory = LocationPresentationModelFactory()
    private var contentModel: LocationPresentationModel
    
    init(coordinator: LocationCoordinator) {
        self.coordinator = coordinator
        self.contentModel = LocationPresentationModelFactory.defaultPresentationModel
    }
    
    /// Loads the view.
    func load(view: LocationView) {
        self.view = view
        
        view.display(presentationModel: contentModel)
    }
    
    /// Validate user input
    func update(latitude: String, longitude: String) {
        let result = factory.createPresentationModel(latitude: latitude, longitude: longitude)
        switch result {
        case .success(let coordinatesPresentationModel):
            contentModel = coordinatesPresentationModel
            view?.display(presentationModel: contentModel)
            view?.dismissKeyboard()
        case .error(let errorPresentationModel):
            view?.display(errorPresentationModel: errorPresentationModel)
        }
    }
    
    /// Validate location and go to the weather screen.
    func seeWeather(latitude: String, longitude: String) {
        let result = factory.createPresentationModel(latitude: latitude, longitude: longitude)
        switch result {
        case .success(let coordinatesPresentationModel):
            contentModel = coordinatesPresentationModel
            let entity = LocationCoordinatesEntity(latitude: latitude, longitude: longitude)
            coordinator.showWeather(at: entity)
            view?.dismissKeyboard()
        case .error(let errorPresentationModel):
            view?.display(errorPresentationModel: errorPresentationModel)
        }
    }
}

extension LocationCoordinatesEntity {
    fileprivate init(latitude: String, longitude: String) {
        let latitudeDouble = Double(latitude)!
        let longitudeDouble = Double(longitude)!
        self.init(latitude: latitudeDouble, longitude: longitudeDouble)
    }
}
