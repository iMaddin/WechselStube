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
            let exchangeRates = state.currencyStore.currencies.compactMap { currency -> ExchangeRate? in
                guard let rate = service.convertRate(from: selected, to: currency) else { return nil }
                
                return ExchangeRate(fromCurrency: selected, toCurrency: currency, rate: rate)
            }
            
            return Just(AppAction.updateExchangeRates(Set(exchangeRates))).eraseToAnyPublisher()
            
        case .updateExchangeRateSource(let source):
            service.source = source
            return Just(AppAction.exchangeRateCalculator(.selected(state.exchangeRateCalculatorState.selected)))
                .eraseToAnyPublisher()
            
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
