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
            
            guard let lastFetchDate = service.lastFetchDate else {
                debugPrint("No existing data. Fetching...")
                return Just(AppAction.data(.fetch))
                    .eraseToAnyPublisher()
            }
            
            debugPrint("Last fetch: (\(Date().timeIntervalSince(lastFetchDate)) seconds ago)")
            
            if lastFetchDate > Date().addingTimeInterval(30*60) {
                debugPrint("Fetching new data...")
                return Just(AppAction.data(.fetch))
                    .eraseToAnyPublisher()
            } else {
                debugPrint("Loading cached data...")
                return Just(AppAction.data(.loadCached))
                    .eraseToAnyPublisher()
            }
            
        case .data(.loadCached):
            guard let currencies = service.currencies,
                  let source = service.exchangeRateSource else { break }
            return Just(AppAction.update(currencies: currencies,
                                         exchangeRateSource: source))
                .eraseToAnyPublisher()
        
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
