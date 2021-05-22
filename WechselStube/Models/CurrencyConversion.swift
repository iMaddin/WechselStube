//
//  CurrencyConversion.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct CurrencyConversion {
    var source: ExchangeRateSource
}

extension CurrencyConversion {
    func convertRate(from: Currency, to: Currency) -> Double? {
        guard let fromRate = source.rates[from],
              let toRate = source.rates[to] else { return nil }
        
        return toRate / fromRate
    }
}
