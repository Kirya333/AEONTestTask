//
//  Login.swift
//  AEONTestTask
//
//  Created by Кирилл Тарасов on 21.10.2021.
//

import Foundation

struct Login: Decodable {
    var success: String
    var response: Response
    
    
    struct Response: Decodable {
        var token: String
    }
}
