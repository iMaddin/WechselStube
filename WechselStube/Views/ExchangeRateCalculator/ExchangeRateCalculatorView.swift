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
        Group {
            VStack {
                inputView()
                    .padding(.horizontal)
                    .background(Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all))
                
                Spacer(minLength: .zero)
                
                exchangeRateList()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        
        return VStack {
            HStack {
                Text(LocalizedStringKey("Choose a currency and enter an amount:"))
                    .font(.caption)
                Spacer()
            }
            .padding(.top)
            
            CurrencyInputView(selected: selectedBinding,
                              currencies: store.state.currencyStore.currencies,
                              amount: amountBinding)
                .frame(height: 44.0)
                .foregroundColor(.accentColor)
        }
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
            initialState: .init(currencyStore: .init(currencies: [.jpy, .usd]),
                                exchangeRateStore: .init(exchangeRates: [.usdJPY]),
                                exchangeRateCalculatorState: .init(selected: .usd, amount: 1.0)),
            reducer: appReducer)
        
        return ExchangeRateCalculatorView()
            .environmentObject(store)
    }
}
