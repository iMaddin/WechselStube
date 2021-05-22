//
//  ExchangeRateCalculatorView.swift
//  WechselStube
//
//  Created by Hiki on 2021/05/22.
//

import SwiftUI

struct ExchangeRateCalculatorView: View {
    
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

private extension ExchangeRateCalculatorView {
    
    func inputView() -> some View {
        let selectedBinding = Binding(
            get: { store.state.exchangeRateCalculatorState.selected },
            set: { store.dispatch(.exchangeRateCalculator(.selected($0))) })
        
        let amountBinding = Binding<String>(
            get: { "\(store.state.exchangeRateCalculatorState.amount)" },
            set: { store.dispatch(.exchangeRateCalculator(.amount(Double($0) ?? .zero))) })
        
        return CurrencyInputView(selected: selectedBinding,
                          currencies: store.state.currencyStore.currencies,
                          amount: amountBinding)
    }
    
    func exchangeRateList() -> some View {
        List(store.state.exchangeRateStore.exchangeRates) { exchangeRate in
            ExchangeRateView(title: exchangeRate.toCurrency.name,
                             subtitle: exchangeRate.toCurrency.name,
                             value: "\(exchangeRate.rate)")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let store: AppStore = .init(
            initialState: .init(),
            reducer: appReducer)
        
        return ExchangeRateCalculatorView()
            .environmentObject(store)
    }
}
