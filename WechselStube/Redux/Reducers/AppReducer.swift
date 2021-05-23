//
//  AppReducer.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

func appReducer(state: inout AppState, action: AppAction) {
    switch action {
    
    case .exchangeRateCalculator(let action):
        exchangeRateCalculatorReducer(state: &state.exchangeRateCalculatorState, action: action)
    
    case .updateCurrencies(let currencies):
        state.currencyStore.currencies = currencies
    case .updateExchangeRateSource(let source):
        state.exchangeRateStore.source = source
        
    case .updateExchangeRates(let rates):
        state.exchangeRateStore.exchangeRates = rates
    }
}
