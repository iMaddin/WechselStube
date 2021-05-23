//
//  ExchangeRateStore.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct ExchangeRateStore: Equatable {
    var source: ExchangeRateSource?
    var exchangeRates: Set<ExchangeRate> = []
}
