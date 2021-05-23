//
//  CurrencyLayerLive.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/23.
//

import Foundation

struct CurrencyLayerLive: Codable {
    var source: String
    var quotes: [String: Double]
}
