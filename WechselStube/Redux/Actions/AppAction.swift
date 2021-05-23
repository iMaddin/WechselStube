//
//  AppAction.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

enum AppAction {
    case data(DataAction)
    case exchangeRateCalculator(ExchangeRateCalculatorAction)
    
    case updateCurrencies(Set<Currency>)
    case updateExchangeRateSource(ExchangeRateSource)
    case updateExchangeRates(Set<ExchangeRate>)
}
