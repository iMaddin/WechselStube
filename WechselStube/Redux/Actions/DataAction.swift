//
//  DataAction.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/23.
//

import Foundation

enum DataAction {
    case load
    
    case fetchCurrencies
    case fetchExchangeRates
    
    case loadCached
    case isLoading(Bool)
}
