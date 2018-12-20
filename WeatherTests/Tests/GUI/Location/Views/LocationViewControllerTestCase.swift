//
//  LocationViewControllerTestCase.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Weather

final class LocationViewControllerTestCase: XCTestCase {

    private var sut: LocationViewController!

    override func setUp() {
        let navigationController = UINavigationController()
        let weatherService = WeatherServiceMock()
        let coordinator = LocationCoordinator(navigationController: navigationController, weatherService: weatherService)
        sut = (UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController)
        sut.presenter = LocationPresenter(coordinator: coordinator)
    }

    func test_snapshot_414x896() {
        // Given
        sut.view.frame = CGRect(x: 0, y: 0, width: 414, height: 896)
        
        // Then
        assertSnapshot(matching: sut.view, as: .image)
    }
}
