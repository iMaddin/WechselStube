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
    
    func testUpdateCurrencies() throws {
        XCTAssertTrue(store.state.currencyStore.currencies.isEmpty)
        
        let currencies: Set<Currency> = [.jpy, .usd]
        store.dispatch(.updateCurrencies(currencies))
        
        XCTAssertEqual(currencies, store.state.currencyStore.currencies)
    }
    
}
