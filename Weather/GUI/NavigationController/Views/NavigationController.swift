//
//  NavigationController.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import UIKit

/// Main app navigation controller.
final class NavigationController: UINavigationController {
    
    private var networkService: NetworkService!
    private var weatherService: WeatherService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // TODO: Move services to an app main coordinator.
        setupServices()
        setupFirstViewController()
    }
    
    private func setupServices() {
        networkService = NetworkService()
        weatherService = WeatherService(networkLayer: networkService)
    }
    
    private func setupFirstViewController() {
        let coordinator = LocationCoordinator(navigationController: self, weatherService: weatherService)
        let presenter = LocationPresenter(coordinator: coordinator)
        let locationViewController = viewControllers.first! as! LocationViewController
        locationViewController.presenter = presenter
    }
}
