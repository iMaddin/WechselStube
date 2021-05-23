//
//  ExchangeRateCalculatorState.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

struct ExchangeRateCalculatorState: Equatable {
    var selected: Currency?
    var amount: Double
}
