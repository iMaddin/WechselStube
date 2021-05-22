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
                                           middlewares: [])
    
    var body: some Scene {
        WindowGroup {
            ExchangeRateCalculatorView()
                .environmentObject(appStore)
        }
    }
}
