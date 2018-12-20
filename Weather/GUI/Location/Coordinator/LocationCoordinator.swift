//
//  LocationCoordinator.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import UIKit

/// Coordinator to the Location screen.
final class LocationCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let weatherService: WeatherServiceProtocol!
    
    init(navigationController: UINavigationController,
         weatherService: WeatherServiceProtocol) {
        self.navigationController = navigationController
        self.weatherService = weatherService
    }
    
    /// Displays the Weather screen for given location.
    ///
    /// - Parameter location: Given location.
    func showWeather(at location: LocationCoordinatesEntity) {
        let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        viewController.presenter = WeatherPresenter(location: location, weatherService: weatherService)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
