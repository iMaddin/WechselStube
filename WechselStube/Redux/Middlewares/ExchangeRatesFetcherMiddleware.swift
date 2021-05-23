//
//  ExchangeRatesFetcherMiddleware.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/23.
//

import Foundation
import Combine

func exchangeRatesFetcherMiddleware(service: CurrencyLayerService) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        
        case .data(.fetchCurrencies):
            return service.fetchCurrencies()
                .map { list in
                    let currencies = list.currencies.map { (code, name) in
                        Currency(code: code, name: name)
                    }
                    
                    return AppAction.updateCurrencies(Set(currencies))
                }
                .catch { _ in
                    Empty<AppAction, Never>().eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
            
        case .data(.fetchExchangeRates):
            return service.fetchExchangeRates()
                .map { live in
                    var rates: [CurrencyCode: Double] = [:]
                    
                    for (key, value) in live.quotes {
                        let currencyCode = key.replacingOccurrences(of: live.source, with: "")
                        
                        rates[currencyCode] = value
                    }
                    
                    rates[live.source] = 1.0
                    
                    let source = ExchangeRateSource(source: live.source,
                                                    rates: rates)
                    
                    return AppAction.updateExchangeRateSource(source)
                }
                .catch { _ in
                    Empty<AppAction, Never>().eraseToAnyPublisher()
                }
                .eraseToAnyPublisher()
                
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
