//
//  NetworkService.swift
//  Weather
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation

/// Interface for the network layer.
protocol NetworkServiceProtocol {
    func send(urlRequest: URLRequest,
              completion: @escaping (NetworkServiceResponse<Data>) -> ())
}

/// Implementation for the network layer.
final class NetworkService {
    
    // Queue on which to run netowkr tasks
    var operatingQueue = DispatchQueue.global()
    
    // Queue on which to run the callbacks
    var completionQueue = DispatchQueue.main
    
    func send(urlRequest: URLRequest,
              completion: @escaping (NetworkServiceResponse<Data>) -> ()) {
    }
}

extension NetworkService: NetworkServiceProtocol {}
