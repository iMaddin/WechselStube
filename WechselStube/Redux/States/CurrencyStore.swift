//
//  CurrencyStore.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct CurrencyStore: Equatable {
    var currencies: Set<Currency> = []
    
    var sortedCurrencies: [Currency] {
        currencies.sorted { $0.code < $1.code }
    }
}
