//
//  PersistentDataMiddleWareTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/23.
//

import XCTest
@testable import WechselStube

class PersistentDataMiddleWareTests: XCTestCase {
    
    private var store: AppStore = .init(initialState: .init(), reducer: appReducer)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension PersistentDataMiddleWareTests {
    
    func testStoreCurrencies() throws {
        store.dispatch(.data(.fetchCurrencies))
        
        // TODO: missing implementation
    }
    
    func testStoreExchangeRates() throws {
        store.dispatch(.data(.fetchExchangeRates))
        
        // TODO: missing implementation
    }
    
}
