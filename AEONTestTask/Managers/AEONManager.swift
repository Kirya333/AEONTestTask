//
//  AEONManager.swift
//  AEONTestTask
//
//  Created by Кирилл Тарасов on 21.10.2021.
//

import Foundation

final class AEONManager {
    
    // MARK: - Private Properties
    private let requestManager: RequestProtocol = RequestManager()
    private let apiManager: APIProtocol = APIManager()
    
    // MARK: - Puplic Methods
    func signin(login: String, password: String, completion: @escaping (Result<Login, Error>) -> Void) {
        let request = requestManager.signinRequest(login: login, password: password)
        apiManager.fetch(request: request, completionHandler: completion)
    }
    
    func getPayments(token: String, completion: @escaping (Result<Payments, Error>) -> Void) {
        let request = requestManager.paymentsRequest(token: token)
        apiManager.fetch(request: request, completionHandler: completion)
    }
}
