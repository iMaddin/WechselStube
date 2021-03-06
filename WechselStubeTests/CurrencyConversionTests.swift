//
//  CurrencyConversionTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/22.
//

import XCTest
@testable import WechselStube

class CurrencyConversionTests: XCTestCase {
    
    private var source: ExchangeRateSource!
    private let usd: Currency = .init(code: "USD", name: "")
    private let jpy: Currency = .init(code: "JPY", name: "")
    private let eur: Currency = .init(code: "EUR", name: "")
    
    private let usdJPY = 108.92504
    private let usdEUR = 0.820934

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        source = .init(source: usd.code,
                       rates: [
                        usd.code: 1.0,
                        jpy.code: usdJPY,
                        eur.code: usdEUR
                       ])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension CurrencyConversionTests {
    
    func testSourceToCurrency() throws {
        let converter = CurrencyConversion(source: source)
        let result = try XCTUnwrap(converter.convertRate(from: usd.code, to: jpy.code))
        
        XCTAssertEqual(result, usdJPY, accuracy: 2)
    }
    
    func testCurrencyToSource() throws {
        let converter = CurrencyConversion(source: source)
        let result = try XCTUnwrap(converter.convertRate(from: jpy.code, to: usd.code))
        let expected = 1 / usdJPY
        
        XCTAssertEqual(result, expected, accuracy: 2)
    }
    
    func testCurrencyPairNotContainingSource() throws {
        let converter = CurrencyConversion(source: source)
        let result = try XCTUnwrap(converter.convertRate(from: eur.code, to: jpy.code))
        let expected = usdJPY / usdEUR
        XCTAssertEqual(result, expected, accuracy: 2)
    }
    
}
