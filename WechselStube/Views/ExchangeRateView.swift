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
            label()
            
            Spacer()
            
            valueView()
        }
    }
    
}

private extension ExchangeRateView {
    
    func label() -> some View {
        CurrencyLabel(title: title,
                      subtitle: subtitle)
    }
    
    func valueView() -> some View {
        Text(value)
            .font(.largeTitle)
            .multilineTextAlignment(.trailing)
    }
    
}

struct ExchangeRateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExchangeRateView(title: "USD",
                             subtitle: "United States Dollars",
                             value: "123.45")
        }
    }
}
