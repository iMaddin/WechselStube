//
//  AppState.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct AppState: Equatable {
    var currencyStore: CurrencyStore = .init()
    var exchangeRateStore: ExchangeRateStore = .init()
    
    var exchangeRateCalculatorState: ExchangeRateCalculatorState = .init(selected: .init(code: "",
                                                                                         name: ""),
                                                                         amount: 1.0)
    
    var dataState: DataState = .init()
}
