//
//  CurrencyInputView.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import SwiftUI

struct CurrencyInputView: View {
    
    @Binding var selected: Currency
    let currencies: [Currency]
    @Binding var amount: String
    
    var body: some View {
        HStack {
            currencyPicker()
            Spacer()
            valueInput()
        }
    }
    
}

private extension CurrencyInputView {
    
    func currencyPicker() -> some View {
        Picker(selection: $selected,
               label: CurrencyLabel(title: selected.code,
                                    subtitle: selected.name)) {
            
            ForEach(currencies) { currency in
                CurrencyLabel(title: currency.code,
                              subtitle: currency.name)
            }
            
        }
        .pickerStyle(MenuPickerStyle())
    }
    
    func valueInput() -> some View {
        TextField("", text: $amount)
            .multilineTextAlignment(.trailing)
    }
    
}

struct CurrencyInputVIew_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyInputView(selected: .constant(.jpy),
                          currencies: [.jpy, .usd],
                          amount: .constant("1"))
    }
}
