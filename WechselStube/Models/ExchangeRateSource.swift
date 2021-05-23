//
//  ExchangeRateSource.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

typealias CurrencyCode = String

struct ExchangeRateSource {
    var source: CurrencyCode
    var rates: [CurrencyCode: Double]
}

extension ExchangeRateSource: Hashable {}
extension ExchangeRateSource: Equatable {}
extension ExchangeRateSource: Codable {}

extension ExchangeRateSource {
    static var none: Self {
        .init(source: "",
              rates: [:])
    }
}
