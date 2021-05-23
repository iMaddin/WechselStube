//
//  ExchangeRateDataServiceTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/22.
//

import XCTest
@testable import WechselStube

class ExchangeRateDataServiceTests: XCTestCase {
    
    let userDefaultsSuiteName = "TestDefaults"
    var service: ExchangeRateDataService?
    
    let usd: Currency = .init(code: "USD", name: "")
    let jpy: Currency = .init(code: "JPY", name: "")
    let eur: Currency = .init(code: "EUR", name: "")
    
    let usdJPY = 108.92504
    let usdEUR = 0.820934
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        UserDefaults().removePersistentDomain(forName: userDefaultsSuiteName)
        if let testDefaults = UserDefaults(suiteName: userDefaultsSuiteName) {
            service = .init(userDefaults: testDefaults)
        }
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}

extension ExchangeRateDataServiceTests {
    
    func testLastFetchDate() throws {
        XCTAssertNil(service?.lastFetchDate)
        
        let expected = Date().addingTimeInterval(-1000)
        service?.lastFetchDate = expected
        
        let result = try XCTUnwrap(service?.lastFetchDate)
        
        XCTAssertTrue(result.compare(expected) == .orderedSame )
    }
    
    func testExchangeRate() throws {
        XCTAssertNil(service?.exchangeRateSource)
        
        let expected: ExchangeRateSource = .init(source: usd.code,
                                                 rates: [
                                                    usd.code: 1.0,
                                                    jpy.code: usdJPY,
                                                    eur.code: usdEUR
                                                 ]
                                                 )
                                                 
        service?.exchangeRateSource = expected
        
        let result = try XCTUnwrap(service?.exchangeRateSource)
        XCTAssertEqual(result, expected)
    }
    
    func testCurrencies() throws {
        XCTAssertNil(service?.currencies)
        
        let expected: Set<Currency> = [.jpy, .usd]
        service?.currencies = expected
        
        let result = try XCTUnwrap(service?.currencies)
        XCTAssertEqual(result, expected)
    }
    
}
