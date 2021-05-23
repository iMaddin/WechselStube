//
//  ExchangeRateSource.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct ExchangeRateSource {
    var source: Currency
    var rates: [Currency: Double]
}

extension ExchangeRateSource: Hashable {}
extension ExchangeRateSource: Equatable {}
extension ExchangeRateSource: Codable {}

extension ExchangeRateSource {
    static var none: Self {
        .init(source: .init(code: "", name: ""),
              rates: [:])
    }
}
