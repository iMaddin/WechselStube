//
//  WechselStubeApp.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import SwiftUI

@main
struct WechselStubeApp: App {
    
    private let appStore: AppStore = .init(initialState: .init(),
                                           reducer: appReducer,
                                           middlewares: [
                                            currencyConversionMiddleware(service: .init(source: .none))
                                           ])
    
    var body: some Scene {
        WindowGroup {
            ExchangeRateCalculatorView()
                .environmentObject(appStore)
        }
    }
}
