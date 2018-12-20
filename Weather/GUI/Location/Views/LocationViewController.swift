//
//  LocationViewController.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import UIKit

/// Interface for the Location view.
protocol LocationView: class {
    /// Displays content.
    func display(presentationModel: LocationPresentationModel)
    /// Displays error.
    func display(errorPresentationModel: LocationErrorPresentationModel)
    /// Dismisses the keyboard.
    func dismissKeyboard()
}

/// Allows user to input a location.
final class LocationViewController: UIViewController {
    
    /// Presenter for the Location view controller. Must be set by the creator of the view controller.
    var presenter: LocationPresenter!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        longitudeTextField.delegate = self
        latitudeTextField.delegate = self
        
        presenter.load(view: self)
    }
    
    @IBAction func userDidTapButton(_ sender: Any) {
        presenter.seeWeather(latitude: latitudeTextField.text ?? "", longitude: longitudeTextField.text ?? "")
    }    
}

extension LocationViewController: LocationView {
    func display(presentationModel: LocationPresentationModel) {
        latitudeTextField.text = presentationModel.latitude
        longitudeTextField.text = presentationModel.longitude
    }
    
    func display(errorPresentationModel: LocationErrorPresentationModel) {
        let alertController = UIAlertController(title: errorPresentationModel.title,
                                                message: errorPresentationModel.message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: errorPresentationModel.okText, style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        latitudeTextField.resignFirstResponder()
        longitudeTextField.resignFirstResponder()
    }
}

extension LocationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter.update(latitude: latitudeTextField.text ?? "", longitude: longitudeTextField.text ?? "")
        return false
    }
}
