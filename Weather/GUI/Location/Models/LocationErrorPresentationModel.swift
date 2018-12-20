//
//  LocationErrorPresentationModel.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Presentation model for an error in the Location screen.
struct LocationErrorPresentationModel: Equatable {
    var title = NSLocalizedString("Error", comment: "")
    var message = ""
    var okText = NSLocalizedString("OK", comment: "")
}

