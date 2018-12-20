//
//  NetworkServiceMock.swift
//  WeatherTests
//
//  Created by Bogdan Iusco on 12/20/18.
//  Copyright © 2018 iGama Apps. All rights reserved.
//

import Foundation
@testable import Weather

final class NetworkServiceMock {
    var response: NetworkServiceResponse<Data>?
    
    func simulateSuccessfulResponse(_ data: Data) {
        response = .success(data)
    }
    
    func simulateFailedResponse(_ error: NetworkServiceError) {
        response = .error(error)
    }
}

extension NetworkServiceMock: NetworkServiceProtocol {
    func send(urlRequest: URLRequest,
              completion: @escaping (NetworkServiceResponse<Data>) -> ()) {
        guard let response = response else { return }
        completion(response)
    }
}
