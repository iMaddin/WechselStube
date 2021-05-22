//
//  ExchangeRateDataService.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import Foundation

enum ExchangeRateKeys: String {
    case lastFetchDate
    case exchangeRate
}

struct ExchangeRateDataService {
    
    var lastFetchDate: Date? {
        get { userDefaults.value(forKey: ExchangeRateKeys.lastFetchDate.rawValue) as? Date }
        set { userDefaults.set(newValue, forKey: ExchangeRateKeys.lastFetchDate.rawValue) }
    }
    
    var exchangeRate: ExchangeRate? {
        get { userDefaults.value(forKey: ExchangeRateKeys.exchangeRate.rawValue) as? ExchangeRate }
        set { userDefaults.set(newValue, forKey: ExchangeRateKeys.exchangeRate.rawValue) }
    }
    
    var userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
}
