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
        
        case .data(.fetch):
            return Publishers.Zip(
                service.fetchCurrencies(),
                service.fetchExchangeRates())
                .map { list, live in
                    let currencies = convert(list: list)
                    let source = convert(live: live)
                    return AppAction.update(currencies: currencies, exchangeRateSource: source)
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

fileprivate func convert(live: CurrencyLayerLive) -> ExchangeRateSource {
    var rates: [CurrencyCode: Double] = [:]
    
    for (key, value) in live.quotes {
        let currencyCode = key.replacingOccurrences(of: live.source, with: "")
        
        rates[currencyCode] = value
    }
    
    rates[live.source] = 1.0
    
    return ExchangeRateSource(source: live.source,
                                    rates: rates)
}

fileprivate func convert(list: CurrencyLayerList) -> Set<Currency> {
    let currencies = list.currencies.map { (code, name) in
        Currency(code: code, name: name)
    }
    return Set(currencies)
}
