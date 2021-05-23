//
//  PersistentDataMiddleware.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation
import Combine

func persistentDataMiddleware(service: ExchangeRateDataService) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        
        case .updateCurrencies(let currencies):
            service.currencies = currencies
            service.lastFetchDate = Date()
        case .updateExchangeRateSource(let source):
            service.exchangeRateSource = source
            service.lastFetchDate = Date()
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
