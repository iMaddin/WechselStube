//
//  CurrencyLabel.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import SwiftUI

struct CurrencyLabel: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.primary)
                .font(.title3)
            
            Text(subtitle)
                .foregroundColor(.secondary)
                .font(.caption)
        }
    }
    
}

struct CurrencyLabel_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyLabel(title: "USD",
                      subtitle: "United States Dollars")
    }
}
