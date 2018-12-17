//
//  essentia_network_core_ios_tests.swift
//  essentia-network-core-ios-tests
//
//  Created by Pavlo Boiko on 15.09.18.
//  Copyright © 2018 Essentia-One. All rights reserved.
//

import XCTest

private var responce: [String: Any] =  ["userId": 1,
                         "id": 1,
                         "title": "delectus aut autem",
                         "completed": false]

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
        network.makeAsyncRequest(TestEndpoint.one) { (result: NetworkResult<TestResponceModel>) in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 60, handler: nil)
    }
}
