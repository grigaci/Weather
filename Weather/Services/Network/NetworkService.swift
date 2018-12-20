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
    
    // Queue on which to run network tasks
    var operatingQueue = DispatchQueue.global()
    
    // Queue on which to run the callbacks
    var completionQueue = DispatchQueue.main
    
    private let transportLayer: URLSession
    
    init(transportLayer: URLSession = URLSession.shared) {
        self.transportLayer = transportLayer
    }
    
    func send(urlRequest: URLRequest,
              completion: @escaping (NetworkServiceResponse<Data>) -> ()) {
        
        let task = transportLayer.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
            guard error == nil, let data = data else {
                // TODO: Add error codes handling
                self?.notify(completion, with: .error(NetworkServiceError.noJSONData))
                return
            }
            self?.notify(completion, with: .success(data))
        })
        task.resume()
    }
    
    private func notify(_ completion: @escaping (NetworkServiceResponse<Data>) -> (),
                        with response: NetworkServiceResponse<Data>) {
        completionQueue.async {
            completion(response)
        }
    }
}

extension NetworkService: NetworkServiceProtocol {}
