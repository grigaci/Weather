//
//  WeatherContentView.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import UIKit

/// Displays weather data.
final class WeatherContentView: UIView {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    var presentationModel: WeatherContentPresentationModel? {
        didSet {
            modelDidChange()
        }
    }
    
    private func modelDidChange() {
        guard let presentationModel = presentationModel else {return}
        descriptionLabel.text = presentationModel.descriptionText
        currentTemperatureLabel.text = presentationModel.temperatureText
        minTemperatureLabel.text = presentationModel.minTemperature
        maxTemperatureLabel.text = presentationModel.maxTemperature
        humidityLabel.text = presentationModel.humidityText
    }
}
