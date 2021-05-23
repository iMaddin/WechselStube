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
        XCTAssertNil(service?.exchangeRate)
        
        let expected: ExchangeRate = .usdJPY
        
        service?.exchangeRate = expected
        
        let result = try XCTUnwrap(service?.exchangeRate)
        XCTAssertEqual(result, expected)
    }
    
}
