//
//  WeatherViewController.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import UIKit

/// Interface for the Weather view.
protocol WeatherView: class {
    func display(presentationModel: WeatherPresentationModel)
}

/// Displays weather for a specifiad location.
final class WeatherViewController: UIViewController {
    
    /// Presenter for this view controller. Must be set by the view controller's creator.
    var presenter: WeatherPresenter!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var errorButton: UIButton!
    @IBOutlet weak var contentView: WeatherContentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.load(view: self)
    }
    
    @IBAction func didPressRetryButton(_ sender: Any) {
        presenter.refetchData()
    }
}

extension WeatherViewController: WeatherView {
    func display(presentationModel: WeatherPresentationModel) {
        var isContentViewHidden = true
        var isErrorViewHidden = true
        var isLoadingViewHidden = true
        
        switch presentationModel {
        case .loading:
            isLoadingViewHidden = false
        case .error(let presentationModel):
            isErrorViewHidden = false
            display(errorPresentationModel: presentationModel)
        case .content(let presentationModel):
            isContentViewHidden = false
            display(contentPresentationModel: presentationModel)
        }
        
        contentView.isHidden = isContentViewHidden
        errorButton.isHidden = isErrorViewHidden
        loadingView.isHidden = isLoadingViewHidden
        
        if isLoadingViewHidden {
            loadingView.stopAnimating()
        } else {
            loadingView.startAnimating()
        }
    }
    
    private func display(errorPresentationModel: WeatherErrorPresentationModel) {
        let alertController = UIAlertController(title: errorPresentationModel.title,
                                                message: errorPresentationModel.message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: errorPresentationModel.okText, style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func display(contentPresentationModel: WeatherContentPresentationModel) {
        contentView.presentationModel = contentPresentationModel
    }
}
