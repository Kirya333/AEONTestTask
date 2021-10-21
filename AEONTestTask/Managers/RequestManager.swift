//
//  AddressesURLs.swift
//  AEONTestTask
//
//  Created by Кирилл Тарасов on 21.10.2021.
//

import Foundation

enum AddressesURLs: String {
    case login = "http://82.202.204.94/api-test/login"
    case payments = "http://82.202.204.94/api-test/payments?token="
}

protocol RequestProtocol {
    func signinRequest(login: String, password: String) -> URLRequest
    func paymentsRequest(token: String) -> URLRequest
}

final class RequestManager: RequestProtocol {
    
    // MARK: - Private Properties
    private var header = ["app-key" : "12345", "v" : "1"]
    
    // MARK: - Public Methods
    func signinRequest(login: String, password: String) -> URLRequest {
        let url = URL(string: AddressesURLs.login.rawValue)!
        var request = URLRequest(url: url)
        
        let logPass = Signin(login: login, password: password)
        let encoder = JSONEncoder()
        let data = try? encoder.encode(logPass)
        
        if let data = data {
            request.httpBody = data
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = header
        }
        
        return request
    }
    
    func paymentsRequest(token: String) -> URLRequest {
        let url = URL(string: AddressesURLs.payments.rawValue + token)!
        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = header
        
        return request
    }
}
