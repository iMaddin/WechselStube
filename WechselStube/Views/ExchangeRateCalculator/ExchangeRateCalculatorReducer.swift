//
//  ExchangeRateCalculatorReducer.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

func exchangeRateCalculatorReducer(state: inout ExchangeRateCalculatorState,
                                   action: ExchangeRateCalculatorAction) {
    switch action {
    
    case .amount(let amount):
        state.amount = amount
    case .selected(let selected):
        state.selected = selected
    }
}
