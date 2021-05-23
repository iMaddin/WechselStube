//
//  ExchangeRate.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct ExchangeRate {
    var fromCurrency: Currency
    var toCurrency: Currency
    var rate: Double
}

extension ExchangeRate: Identifiable {
    var id: String {
        fromCurrency.code + toCurrency.code
    }
}

extension ExchangeRate: Equatable {}
extension ExchangeRate: Hashable {}
extension ExchangeRate: Codable {}

extension ExchangeRate {
    static var usdJPY: Self {
        .init(fromCurrency: .usd,
              toCurrency: .jpy, rate: 110)
    }
}
