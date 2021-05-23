//
//  PersistentDataMiddleWareTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/23.
//

import XCTest
@testable import WechselStube

class PersistentDataMiddleWareTests: XCTestCase {
    
    let userDefaultsSuiteName = "TestDefaults"
    
    private var store: AppStore!
    private var fetchDate: Date!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        fetchDate = Date()
        
        UserDefaults().removePersistentDomain(forName: userDefaultsSuiteName)
        
        if let testDefaults = UserDefaults(suiteName: userDefaultsSuiteName) {
            let service = ExchangeRateDataService(userDefaults: testDefaults)
            service.lastFetchDate = fetchDate
            
            store = .init(initialState: .init(),
                                               reducer: appReducer,
                                               middlewares: [
                                               persistentDataMiddleware(service: service)])
        }
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension PersistentDataMiddleWareTests {
    
    func testStoreData() throws {
//        store.state.
        
        store.dispatch(.data(.fetch))
        
        // TODO: missing implementation
    }
    
}
