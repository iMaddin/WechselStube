//
//  AppStateTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/23.
//

import XCTest
@testable import WechselStube

class AppStateTests: XCTestCase {
    
    private var store: AppStore = .init(initialState: .init(), reducer: appReducer)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension AppStateTests {
    
    func testUpdate() throws {
        XCTAssertTrue(store.state.currencyStore.currencies.isEmpty)
        
        let usd: Currency = .init(code: "USD", name: "")
        let jpy: Currency = .init(code: "JPY", name: "")
        let eur: Currency = .init(code: "EUR", name: "")
        
        let usdJPY = 108.92504
        let usdEUR = 0.820934
        
        let source: ExchangeRateSource = .init(source: usd.code,
                                               rates: [
                                                usd.code: 1.0,
                                                jpy.code: usdJPY,
                                                eur.code: usdEUR
                                               ])
        let currencies: Set<Currency> = [.jpy, .usd]
        store.dispatch(.update(currencies: currencies, exchangeRateSource: source))
        
        XCTAssertEqual(currencies, store.state.currencyStore.currencies)
    }
    
}
