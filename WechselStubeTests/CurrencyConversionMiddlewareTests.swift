//
//  CurrencyConversionMiddlewareTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/22.
//

import XCTest
@testable import WechselStube

class CurrencyConversionMiddlewareTests: XCTestCase {
    
    var store: AppStore!
    
    private var source: ExchangeRateSource!
    private let usd: Currency = .init(code: "USD", name: "")
    private let jpy: Currency = .init(code: "JPY", name: "")
    private let eur: Currency = .init(code: "EUR", name: "")
    
    private let usdJPY = 108.92504
    private let usdEUR = 0.820934

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let currencyStore: CurrencyStore = .init(currencies: [usd,
                                                              jpy,
                                                              eur])
        
        let initialState: AppState = .init(currencyStore: currencyStore,
                                           exchangeRateStore: .init(),
                                           exchangeRateCalculatorState: .init(selected: usd,
                                                                              amount: 1.0))
        
        let source: ExchangeRateSource = .init(source: usd,
                                               rates: [
                                                usd: 1.0,
                                                jpy: usdJPY,
                                                eur: usdEUR
                                               ]
        )
        
        store = .init(initialState: initialState,
                      reducer: appReducer,
                      middlewares: [
                        currencyConversionMiddleware(service: .init(source: source))
                      ])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension CurrencyConversionMiddlewareTests {
    
    func testCurrencyChange() throws {
        let testExpectation = expectation(description: "Currency change")

        store.dispatch(.exchangeRateCalculator(.selected(eur)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            let result = store.state.exchangeRateStore.exchangeRates
            let expected: Set<ExchangeRate> = [
                ExchangeRate(fromCurrency: eur, toCurrency: eur, rate: 1.0),
                ExchangeRate(fromCurrency: eur, toCurrency: jpy, rate: usdJPY / usdEUR),
                ExchangeRate(fromCurrency: eur, toCurrency: usd, rate:  1 / usdEUR),
            ]
            
            XCTAssertEqual(result, expected)
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
}