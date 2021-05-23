//
//  CurrencyConversion.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

class CurrencyConversion {
    var source: ExchangeRateSource
    
    init(source: ExchangeRateSource) {
        self.source = source
    }
    
}

extension CurrencyConversion {
    func convertRate(from: CurrencyCode, to: CurrencyCode) -> Double? {
        guard let fromRate = source.rates[from],
              let toRate = source.rates[to] else { return nil }
        
        return toRate / fromRate
    }
}
