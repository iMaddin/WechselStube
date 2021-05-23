//
//  DataStateTests.swift
//  WechselStubeTests
//
//  Created by Hiki on 2021/05/23.
//

import XCTest
@testable import WechselStube

class DataStateTests: XCTestCase {
    
    private var store: AppStore = .init(initialState: .init(),
                                        reducer: appReducer)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}

extension DataStateTests {
    
    func testIsLoading() throws {
        XCTAssertFalse(store.state.dataState.isLoading)
        
        store.dispatch(.data(.isLoading(false)))
        XCTAssertFalse(store.state.dataState.isLoading)
        
        store.dispatch(.data(.isLoading(true)))
        XCTAssertTrue(store.state.dataState.isLoading)
        
        store.dispatch(.data(.isLoading(false)))
        XCTAssertFalse(store.state.dataState.isLoading)
    }
    
}
