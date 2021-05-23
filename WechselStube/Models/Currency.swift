//
//  Currency.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct Currency {
    var code: String
    var name: String
}

extension Currency: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
        hasher.combine(name)
    }
}

extension Currency: Identifiable {
    var id: String {
        code + name
    }
}

extension Currency: Equatable {}
extension Currency: Codable {}

extension Currency {
    
    static var usd: Self {
        .init(code: "USD", name: "United States Dollars")
    }
    
    static var jpy: Self {
        .init(code: "JPY", name: "Japanese Yen")
    }
    
}
