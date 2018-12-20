//
//  WeatherViewControllerTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Weather

final class WeatherViewControllerTestCase: XCTestCase {
    
    private var sut: WeatherViewController!
    
    override func setUp() {
        sut = (UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController)
        sut.presenter = WeatherPresenter(location: LocationCoordinatesEntity.random(),
                                         weatherService: WeatherServiceMock())
        sut.loadViewIfNeeded()
    }

    func test_snapshot_414x896() {
        // Given
        sut.view.frame = CGRect(x: 0, y: 0, width: 414, height: 896)

        var contentPresentationModel = WeatherContentPresentationModel()
        contentPresentationModel.descriptionText = "Cloudy"
        contentPresentationModel.temperatureText = "21 °C"
        contentPresentationModel.minTemperature = "1 °C"
        contentPresentationModel.maxTemperature = "30 °C"
        contentPresentationModel.humidityText = "100"
        sut.display(presentationModel: .content(contentPresentationModel))
        

        // Then
        assertSnapshot(matching: sut.view, as: .image)
    }
}
