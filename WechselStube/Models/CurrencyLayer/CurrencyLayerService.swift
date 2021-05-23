//
//  CurrencyLayerService.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/23.
//

import Foundation
import Combine

struct CurrencyLayerService {
    
    private let apiClient: APIClient = .init(baseURL: "http://api.currencylayer.com")
    
    private let availableCurrenciesRequest: Request = .init(
        path: "/list",
        queryParams: apiKeyParameter)
    
    private let exchangeRates: Request = .init(
        path: "/live",
        queryParams: apiKeyParameter)
    
}

extension CurrencyLayerService {
    
    func fetchCurrencies() -> AnyPublisher<CurrencyLayerList, WechselError> {
        apiClient.dispatch(request: availableCurrenciesRequest)
    }
    
    func fetchExchangeRates(/*sourceCurrencyCode: String = "USD"*/) -> AnyPublisher<CurrencyLayerLive, WechselError> {
        apiClient.dispatch(request: exchangeRates)
    }
    
}

private extension CurrencyLayerService {
    static var apiKeyParameter: [String: String] {
        ["access_key" : currencyLayerApiKey]
    }
}
