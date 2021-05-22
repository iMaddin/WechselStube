//
//  ExchangeRateCalculatorTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/22.
//

import XCTest
@testable import WechselStube

class ExchangeRateCalculatorTests: XCTestCase {

    var store: AppStore!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        store = .init(initialState: .init(), reducer: appReducer)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension ExchangeRateCalculatorTests {
    
    func testSetAmount() throws {
        store.dispatch(.exchangeRateCalculator(.amount(123)))
        XCTAssertEqual(store.state.exchangeRateCalculatorState.amount, 123)
    }
    
    func setCurrency() throws {
        store.dispatch(.exchangeRateCalculator(.selected(.jpy)))
        XCTAssertEqual(store.state.exchangeRateCalculatorState.selected, .jpy)
    }
    
}
