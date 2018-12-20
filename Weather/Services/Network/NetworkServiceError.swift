//
//  NetworkServiceError.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Possible error cases for a network request.
enum NetworkServiceError: Error {
    case unknown
    case noJSONData
    case decodingFailed
}
