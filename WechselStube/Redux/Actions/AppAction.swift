//
//  AppAction.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

enum AppAction {
    case exchangeRateCalculator(ExchangeRateCalculatorAction)
    case updateExchangeRates(Set<ExchangeRate>)
}
