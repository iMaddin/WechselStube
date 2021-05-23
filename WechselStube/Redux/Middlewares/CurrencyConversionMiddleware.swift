//
//  CurrencyConversionMiddleware.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation
import Combine

func currencyConversionMiddleware(service: CurrencyConversion) -> Middleware<AppState, AppAction> {
    { state, action in
        switch action {
        
        case .exchangeRateCalculator(.selected(let selected)):
            guard let selected = selected else {
                return Empty().eraseToAnyPublisher()
            }
            
            let exchangeRates = state.currencyStore.currencies.compactMap { currency -> ExchangeRate? in
                guard let rate = service.convertRate(from: selected.code, to: currency.code) else { return nil }
                
                return ExchangeRate(fromCurrency: selected, toCurrency: currency, rate: rate)
            }
            
            return Just(AppAction.updateExchangeRates(Set(exchangeRates))).eraseToAnyPublisher()
            
        case .update(currencies: let currencies, exchangeRateSource: let source):
        
            guard let selected = currencies.first(where: { $0.code == service.source.source }) else {
                return Empty().eraseToAnyPublisher()
            }

            service.source = source
            
            return Just(AppAction.exchangeRateCalculator(.selected(selected)))
                .eraseToAnyPublisher()
            
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
