//
//  Payments.swift
//  AEONTestTask
//
//  Created by Кирилл Тарасов on 21.10.2021.
//

import Foundation

struct Payments: Decodable {
    var success: String
    var response: [Response]
}

struct Response {
    var desc: String?
    var amount: Double?
    var currency: String?
    var created: Float?
    
    enum CodingKeys: String, CodingKey {
        case desc
        case amount
        case currency
        case created
    }
}

extension Response: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
       
        desc = try? values.decode(String.self, forKey: .desc)
        currency = try? values.decode(String.self, forKey: .currency)
        created = try? values.decode(Float.self, forKey: .created)
        
        if let amountDouble = try? values.decode(Double.self, forKey: .amount) {
            amount = amountDouble
        }
        if let amountString = try? values.decode(String.self, forKey: .amount) {
            amount = Double(amountString)
        }
    }
}

