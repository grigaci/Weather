//
//  LocationViewMock.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

final class LocationViewMock {
    var displayPresentationModelImpl: (LocationPresentationModel) -> Void = { _ in }
    var displayErrorPresentationModelImpl: (LocationErrorPresentationModel) -> Void = { _ in }
    var dismissKeyboardImpl: () -> Void = { }
}

extension LocationViewMock: LocationView {

    func display(presentationModel: LocationPresentationModel) {
        displayPresentationModelImpl(presentationModel)
    }
    
    func display(errorPresentationModel: LocationErrorPresentationModel) {
        displayErrorPresentationModelImpl(errorPresentationModel)
    }
    
    func dismissKeyboard() {
        dismissKeyboardImpl()
    }
}
