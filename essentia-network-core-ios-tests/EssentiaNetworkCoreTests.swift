//
//  essentia_network_core_ios_tests.swift
//  essentia-network-core-ios-tests
//
//  Created by Pavlo Boiko on 15.09.18.
//  Copyright © 2018 Essentia-One. All rights reserved.
//

import XCTest

class EssentiaNetworkCoreTests: XCTestCase {
    let network = NetworkManager("https://jsonplaceholder.typicode.com")
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let expectation = self.expectation(description: "Returns responce")
        network.makeRequest(TestEndpoint.one) { (result: Result<String>) in
            expectation.fulfill()
            print(result)
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
