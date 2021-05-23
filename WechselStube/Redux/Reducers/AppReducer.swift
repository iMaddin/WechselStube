//
//  AppReducer.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

func appReducer(state: inout AppState, action: AppAction) {
    switch action {
    
    case .data(let action):
        dataReducer(state: &state.dataState, action: action)
        
    case .exchangeRateCalculator(let action):
        exchangeRateCalculatorReducer(state: &state.exchangeRateCalculatorState, action: action)
    
    case .update(currencies: let currencies, exchangeRateSource: let source):
        state.currencyStore.currencies = currencies
        state.exchangeRateStore.source = source
        
        if state.exchangeRateCalculatorState.selected == nil,
           let currency = currencies.first(where: { $0.code == source.source }) {
            state.exchangeRateCalculatorState.selected = currency
        }
 
    case .updateExchangeRates(let rates):
        state.exchangeRateStore.exchangeRates = rates
        
    }
}
