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
    case .updateExchangeRates(let rates):
        state.exchangeRateStore.exchangeRates = rates
    }
}
