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
    
    var userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
}

extension ExchangeRateDataService {
    
    var lastFetchDate: Date? {
        get { userDefaults.value(forKey: ExchangeRateKeys.lastFetchDate.rawValue) as? Date }
        set { userDefaults.set(newValue, forKey: ExchangeRateKeys.lastFetchDate.rawValue) }
    }
    
    var exchangeRate: ExchangeRate? {
        get {
            guard let data = userDefaults.value(forKey: ExchangeRateKeys.exchangeRate.rawValue) as? Data else { return nil }
            return try? JSONDecoder().decode(ExchangeRate.self, from: data)
        }
        set {
            
            if let newValue = newValue,
               let data = try? JSONEncoder().encode(newValue) {
               userDefaults.set(data, forKey: ExchangeRateKeys.exchangeRate.rawValue)
            }
        }
    }
    
}
