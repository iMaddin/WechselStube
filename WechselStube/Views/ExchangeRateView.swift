//
//  ExchangeRateView.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import SwiftUI

struct ExchangeRateView: View {
    
    let title: String
    let subtitle: String
    let value: String
    
    var body: some View {
        HStack {
            labels()
            
            Spacer()
            
            Text(value)
                .font(.title)
                .bold()
        }
    }
}

private extension ExchangeRateView {
    func labels() -> some View {
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

struct ExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRateView(title: "USD",
                         subtitle: "United States Dollars",
                         value: "123.45")
    }
}
