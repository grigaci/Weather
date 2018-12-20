//
//  NetworkServiceResponse.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Generic response for a network request.
enum NetworkServiceResponse<ResponseObject> {
    case success(ResponseObject)
    case error(NetworkServiceError)
    
    var object: ResponseObject? {
        guard case .success(let data) = self else {return nil}
        return data
    }
}
