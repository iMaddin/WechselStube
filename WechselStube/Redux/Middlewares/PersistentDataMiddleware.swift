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
        
        case .data(.load):
            if let lastFetchDate = service.lastFetchDate,
            lastFetchDate > Date().addingTimeInterval(30*60) {
                return Just(AppAction.data(.fetch))
                    .eraseToAnyPublisher()
            } else {
                return Just(AppAction.data(.loadCached))
                    .eraseToAnyPublisher()
            }
        
        case .update(currencies: let currencies, exchangeRateSource: let source):
            service.currencies = currencies
            service.exchangeRateSource = source
            service.lastFetchDate = Date()
            
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
