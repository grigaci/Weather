//
//  WeatherView.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

final class WeatherViewMock {
    var displayImpl: (WeatherPresentationModel) -> Void = { _ in }
}

extension WeatherViewMock: WeatherView {

    func display(presentationModel: WeatherPresentationModel) {
        displayImpl(presentationModel)
    }
}
