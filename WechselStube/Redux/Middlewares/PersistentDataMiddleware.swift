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
        
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
